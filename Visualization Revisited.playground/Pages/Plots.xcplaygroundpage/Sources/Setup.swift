import Foundation
import PlaygroundSupport
import UIKit

public var vc = PlotVisualizationViewController()

public let plotView: PlotView = _interface._plot!.plotView
public let keyView: ChartKeyView = _interface._plot!.keyView
 
public func makePlot() {
    PlaygroundPage.current.liveView = vc
}
