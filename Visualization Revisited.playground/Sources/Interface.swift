import PlaygroundSupport
import UIKit

// Hiding API so that we can control autocomplete exposure in the Setup source file.
public struct Interface {

    public var _pie: PieChartVisualizationViewController? {
        get {
            return PlaygroundPage.current.liveView as? PieChartVisualizationViewController
        }
    }
    
    public var _bar: BarChartVisualizationViewController? {
        get {
            return PlaygroundPage.current.liveView as? BarChartVisualizationViewController
        }
    }
    
    public var _plot: PlotVisualizationViewController? {
        get {
            return PlaygroundPage.current.liveView as? PlotVisualizationViewController
        }
    }

    private var _key: ChartKeyProviding? {
        get {
            return PlaygroundPage.current.liveView as? ChartKeyProviding
        }
    }

}

public let _interface = Interface()
