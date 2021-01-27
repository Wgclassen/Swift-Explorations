import UIKit

public struct ChartBar {
    var length: Double
    var color: Color
    fileprivate var id: Int
    static var nextID = 0
    
    public init(length: Double, color: Color) {
        self.length = length
        self.color = color
        id = ChartBar.nextID
        ChartBar.nextID += 1
    }
}

fileprivate class BarContainerView: UIView {
    
    fileprivate class AxesView: UIView {
        override init(frame: CGRect) {
            super.init(frame: frame)
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        convenience init() {
            self.init(frame: .zero)
        }
        
        override func draw(_ rect: CGRect) {
            let context = UIGraphicsGetCurrentContext()
            
            context?.setStrokeColor(PlatformColor.black.cgColor)
            context?.setLineWidth(2)
            context?.strokeLineSegments(between: [.zero, CGPoint(x: self.bounds.size.width, y: 0)])
            context?.strokeLineSegments(between: [.zero, CGPoint(x: 0, y: self.bounds.size.height)])
        }
    }
    
    let axesView = AxesView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(axesView)
        axesView.isOpaque = false
        axesView.layer.zPosition = 1000
        self.clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    private var chartView: BarChartView {
        get {
            return superview! as! BarChartView
        }
    }
    
    private var bars: [ChartBar] {
        get {
            return chartView.bars
        }
    }
    
    private var barViews: [Int:UIView] {
        get {
            return chartView.barViews
        }
    }
    
    var barSpacing: Double {
        get {
            return chartView.barSpacing
        }
    }
    
    var yAxisMinimum: Double {
        get {
            return chartView.yAxisMinimum
        }
    }
    
    var yAxisMaximum: Double {
        get {
            return chartView.yAxisMaximum
        }
    }
    
    override func layoutSubviews() {
        axesView.frame = self.bounds
        
        let availableWidth = Double(self.bounds.size.width) - Double(bars.count + 1) * barSpacing
        let barWidth = availableWidth / Double(bars.count)
        var x = barSpacing
        for bar in bars {
            guard let barView = barViews[bar.id] else {
                continue
            }
            
            barView.frame = CGRect(x: x, y: -Double(self.bounds.size.height) * (yAxisMinimum / (yAxisMaximum - yAxisMinimum)), width: barWidth, height: Double(self.bounds.size.height) * (bar.length / (yAxisMaximum - yAxisMinimum)))
            
            x += barWidth + barSpacing
        }
        
        super.layoutSubviews()
    }
}

public class BarChartView: UIView {
    fileprivate var barViews = [Int:UIView]()
    private let chartContainer = BarContainerView()
    
    private let margin = CGFloat(20)
    private let verticalAxisLabels = AxisLabelContainerView(orientation: .vertical)
    private let horizontalAxisLabels = OrientedLabelStack()
    
    public var bars = [ChartBar]() {
        didSet {
            for (_, barView) in barViews {
                barView.removeFromSuperview()
            }
            barViews.removeAll()
            
            for bar in bars {
                let barView = UIView()
                barView.translatesAutoresizingMaskIntoConstraints = false
                barView.backgroundColor = bar.color.platformColor
                barViews[bar.id] = barView
                chartContainer.addSubview(barView)
            }
            
            self.setNeedsLayout()
        }
    }
    
    public var seriesLabels = [String]() {
        didSet {
            horizontalAxisLabels.labelValues = seriesLabels
            self.setNeedsLayout()
        }
    }
    
    public var seriesLabelGravity: AxisLabelGravity {
        get {
            return horizontalAxisLabels.gravity
        }
        set {
            horizontalAxisLabels.gravity = newValue
        }
    }
    
    public var seriesLabelAttachment: AxisLabelAttachment {
        get {
            return horizontalAxisLabels.attachment
        }
        set {
            horizontalAxisLabels.attachment = newValue
        }
    }
    
    public var seriesLabelDistributionStyle: AxisLabelDistributionStyle {
        get {
            return horizontalAxisLabels.distributionStyle
        }
        set {
            horizontalAxisLabels.distributionStyle = newValue
        }
    }
    
    public var yAxisMinimum = 0.0 {
        didSet {
            set(verticalAxisLabels.min, with: yAxisMinimum)
            setNeedsLayout()
        }
    }
    
    public var yAxisMaximum = 1.0 {
        didSet {
            set(verticalAxisLabels.max, with: yAxisMaximum)
            setNeedsLayout()
        }
    }
    
    public var barSpacing = 7.0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    private func set(_ label: UILabel, with value: Double) {
        label.text = String(format: "%.2f", value)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        finalSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        finalSetup()
    }
    
    private func finalSetup() {
        super.layoutSubviews()
        
        self.addSubview(verticalAxisLabels)
        verticalAxisLabels.translatesAutoresizingMaskIntoConstraints = false
        verticalAxisLabels.widthAnchor.constraint(equalToConstant: margin).isActive = true
        verticalAxisLabels.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        verticalAxisLabels.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100).isActive = true
        verticalAxisLabels.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        set(verticalAxisLabels.min, with: 0)
        set(verticalAxisLabels.max, with: 1)
        
        self.addSubview(chartContainer)
        chartContainer.translatesAutoresizingMaskIntoConstraints = false
        chartContainer.layer.isGeometryFlipped = true
        chartContainer.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        chartContainer.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        chartContainer.leftAnchor.constraint(equalTo: verticalAxisLabels.rightAnchor, constant: 5).isActive = true
        
        self.addSubview(horizontalAxisLabels)
        horizontalAxisLabels.labelAngle = Double.pi / 2
        horizontalAxisLabels.attachment = .end
        horizontalAxisLabels.gravity = .top
        horizontalAxisLabels.distributionStyle = .centeredIntervals
        horizontalAxisLabels.translatesAutoresizingMaskIntoConstraints = false
        horizontalAxisLabels.widthAnchor.constraint(equalTo: chartContainer.widthAnchor).isActive = true
        horizontalAxisLabels.topAnchor.constraint(equalTo: chartContainer.bottomAnchor).isActive = true
        horizontalAxisLabels.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        horizontalAxisLabels.leftAnchor.constraint(equalTo: chartContainer.leftAnchor).isActive = true
        horizontalAxisLabels.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
}
