import Foundation
import UIKit

public class BarChartVisualizationViewController: UIViewController, ChartKeyProviding {
    public let barView: BarChartView
    public let keyView: ChartKeyView
    
    public init() {
        barView = BarChartView(frame: .zero)
        keyView = ChartKeyView(frame: .zero)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var bars: [ChartBar] {
        get {
            return barView.bars
        }
        set {
            barView.bars = newValue
        }
    }
    
    public var seriesLabels: [String] {
        get {
            return barView.seriesLabels
        }
        set {
            barView.seriesLabels = newValue
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
        
        barView.translatesAutoresizingMaskIntoConstraints = false
        keyView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(barView)
        view.addSubview(keyView)
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[bar]-|", options: [], metrics: [:], views: ["bar": barView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[key]-|", options: [], metrics: [:], views: ["key": keyView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[bar]-12-[key]", options: [], metrics: [:], views: ["bar": barView, "key": keyView]))
        barView.addConstraint(NSLayoutConstraint(item: barView, attribute: .height, relatedBy: .equal, toItem: barView, attribute: .width, multiplier: 1, constant: 0))
    }
    
}

