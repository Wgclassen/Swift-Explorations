import UIKit

public class PieChartVisualizationViewController: UIViewController, ChartKeyProviding {
    public let pieView: PieChartView
    public let keyView: ChartKeyView
    
    public init() {
        pieView = PieChartView(frame: .zero)
        keyView = ChartKeyView(frame: .zero)

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public var wedges: [PieWedge] {
        get {
            return pieView.wedges
        }
        set {
            pieView.wedges = newValue
        }
    }
    
    var keyItems: [ChartKeyItem] {
        get {
            return keyView.keyItems
        }
        set {
            keyView.keyItems = newValue
        }
    }
    
    public func addKeyItem(withLabel label: String, color: Color) {
        keyItems.append(ChartKeyItem(color: color, name: label, symbol: .square))
    }

    public override func loadView() {
        view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        pieView.translatesAutoresizingMaskIntoConstraints = false
        keyView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(pieView)
        view.addSubview(keyView)
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[pie]-|", options: [], metrics: [:], views: ["pie": pieView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[key]-|", options: [], metrics: [:], views: ["key": keyView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-12-[pie]-12-[key]", options: [], metrics: [:], views: ["pie": pieView, "key": keyView]))
        pieView.addConstraint(NSLayoutConstraint(item: pieView, attribute: .height, relatedBy: .equal, toItem: pieView, attribute: .width, multiplier: 1, constant: 0))
    }
}

