import UIKit

public class PlotVisualizationViewController: UIViewController, ChartKeyProviding {
    public let plotView: PlotView
    public let keyView: ChartKeyView
    
    public init() {
        plotView = PlotView(frame: .zero)
        keyView = ChartKeyView(frame: .zero)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public var points: [PlotPoint] {
        get {
            return plotView.points
        }
        set {
            plotView.points = newValue
        }
    }
    
    public var keyItems: [ChartKeyItem] {
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
        
        plotView.translatesAutoresizingMaskIntoConstraints = false
        keyView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(plotView)
        view.addSubview(keyView)
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[plot]-|", options: [], metrics: [:], views: ["plot": plotView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[key]-|", options: [], metrics: [:], views: ["key": keyView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[plot]-12-[key]", options: [], metrics: [:], views: ["plot": plotView, "key": keyView]))
        plotView.addConstraint(NSLayoutConstraint(item: plotView, attribute: .height, relatedBy: .equal, toItem: plotView, attribute: .width, multiplier: 1, constant: 0))
    }
    
}

