import UIKit

public struct PlotPoint {
    var x = 0.5
    var y = 0.5
    var color = Color.black
    var size = 4.0
    var symbol = Symbol.circle
    
    public init(x: Double, y: Double) {
        self.init(x: x, y: y, color: .black, size: 5, symbol: .circle)
    }
    
    public init(x: Double, y: Double, color: Color) {
        self.init(x: x, y: y, color: color, size: 5, symbol: .circle)
    }
    
    public init(x: Double, y: Double, color: Color, size: Double) {
        self.init(x: x, y: y, color: color, size: size, symbol: .circle)
    }
    
    public init(x: Double, y: Double, color: Color, size: Double, symbol: Symbol) {
        self.x = x
        self.y = y
        self.color = color
        self.size = size
        self.symbol = symbol
    }
}

public enum PlotMode {
    case pointsOnly
    case linesOnly
    case pointsAndLines
}

public class PlotView: UIView {
    
    public var mode = PlotMode.pointsOnly {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public var points = [PlotPoint]() {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public var xAxisMinimum = 0.0 {
        didSet {
            set(horizontalAxisLabels.min, with: xAxisMinimum)
            setNeedsDisplay()
            setNeedsUpdateConstraints()
        }
    }
    
    public var xAxisMaximum = 1.0 {
        didSet {
            set(horizontalAxisLabels.max, with: xAxisMaximum)
            setNeedsDisplay()
            setNeedsUpdateConstraints()
        }
    }
    
    public var yAxisMinimum = 0.0 {
        didSet {
            set(verticalAxisLabels.min, with: yAxisMinimum)
            setNeedsDisplay()
            setNeedsUpdateConstraints()
        }
    }
    
    public var yAxisMaximum = 1.0 {
        didSet {
            set(verticalAxisLabels.max, with: yAxisMaximum)
            setNeedsDisplay()
            setNeedsUpdateConstraints()
        }
    }
    
    private func set(_ label: UILabel, with value: Double) {
        label.text = String(format: "%.2f", value)
    }
    
    private let margin = CGFloat(20)
    
    private let horizontalAxisLabels = AxisLabelContainerView(orientation: .horizontal)
    private let verticalAxisLabels = AxisLabelContainerView(orientation: .vertical)
    
    public override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        self.isOpaque = false
        
        self.addSubview(horizontalAxisLabels)
        horizontalAxisLabels.translatesAutoresizingMaskIntoConstraints = false
        horizontalAxisLabels.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -margin).isActive = true
        horizontalAxisLabels.leftAnchor.constraint(equalTo: self.leftAnchor, constant: margin).isActive = true
        horizontalAxisLabels.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        horizontalAxisLabels.heightAnchor.constraint(equalToConstant: margin).isActive = true
        set(horizontalAxisLabels.min, with: 0)
        set(horizontalAxisLabels.max, with: 1)
        
        self.addSubview(verticalAxisLabels)
        verticalAxisLabels.translatesAutoresizingMaskIntoConstraints = false
        verticalAxisLabels.widthAnchor.constraint(equalToConstant: margin).isActive = true
        verticalAxisLabels.topAnchor.constraint(equalTo: self.topAnchor, constant: margin).isActive = true
        verticalAxisLabels.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -margin).isActive = true
        verticalAxisLabels.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        set(verticalAxisLabels.min, with: 0)
        set(verticalAxisLabels.max, with: 1)
    }
    
    public override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.translateBy(x: margin, y: margin)
        context.scaleBy(x: (self.bounds.size.width - 2 * margin) / self.bounds.size.width, y: -(self.bounds.size.height - 2 * margin) / self.bounds.size.height)
        context.translateBy(x: 0, y: -self.bounds.size.height)
        
        context.setStrokeColor(Color.black.cgColor)
        context.move(to: CGPoint(x: 0, y: 0))
        context.addLine(to: CGPoint(x: self.bounds.size.width, y: 0))
        context.move(to: CGPoint(x: 0, y: 0))
        context.addLine(to: CGPoint(x: 0, y: self.bounds.size.height))
        context.strokePath()
        
        func x(of point: PlotPoint) -> CGFloat {
            return CGFloat((point.x - xAxisMinimum) / (xAxisMaximum - xAxisMinimum)) * self.bounds.size.width
        }
        
        func y(of point: PlotPoint) -> CGFloat {
            return CGFloat((point.y - yAxisMinimum) / (yAxisMaximum - yAxisMinimum)) * self.bounds.size.height
        }
        
        func drawPosition(of point: PlotPoint) -> CGPoint {
            return CGPoint(x: x(of: point), y: y(of: point))
        }
        
        if mode != .linesOnly {
            for point in points {
                guard
                    (xAxisMinimum ... xAxisMaximum).contains(point.x) &&
                        (yAxisMinimum ... yAxisMaximum).contains(point.y)
                    else {
                        continue
                }
                
                context.saveGState()
                
                context.translateBy(x: CGFloat((point.x - xAxisMinimum) / (xAxisMaximum - xAxisMinimum)) * self.bounds.size.width, y: CGFloat((point.y - yAxisMinimum) / (yAxisMaximum - yAxisMinimum)) * self.bounds.size.height)
                context.scaleBy(x: CGFloat(point.size), y: CGFloat(point.size))
                context.addPath(point.symbol.unitPath.cgPath)
                
                context.restoreGState()
                
                context.saveGState()
                
                context.setFillColor(point.color.cgColor)
                context.setStrokeColor(point.color.cgColor)
                
                switch point.symbol {
                case .x, .plus:
                    context.strokePath()
                default:
                    context.fillPath()
                }
                
                context.restoreGState()
            }
        }
        
        if mode != .pointsOnly {
            struct SymbolColor: Hashable, Equatable {
                var s: Symbol
                var c: Color
            }
            let symbolSeries = points.reduce([SymbolColor:[PlotPoint]]()) { inResult, point in
                var outResult = inResult
                outResult[SymbolColor(s: point.symbol, c: point.color), default: []].append(point)
                return outResult
            }
            let seriesGroups = Array(symbolSeries.values)
            
            
            for var series in seriesGroups {
                series.sort { $0.x < $1.x }
                
                guard let first = series.first else { continue }
                
                context.move(to: drawPosition(of: first))
                context.setStrokeColor(first.color.cgColor)
                
                for point in series {
                    context.addLine(to: drawPosition(of: point))
                }
                
                context.strokePath()
            }
        }
    }
    
}
