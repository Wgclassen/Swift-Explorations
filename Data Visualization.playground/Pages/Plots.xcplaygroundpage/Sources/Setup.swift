import Foundation
import PlaygroundSupport
import UIKit

public func addPointAt(x: Double, y: Double, color: Color) {
    _interface._addPointAt(x: x, y: y, color: color, size: 5, shape: .circle)
}

public func makePlot() {
    PlaygroundPage.current.liveView = PlotVisualizationViewController()
    
    _interface._setXAxis(minimum: 0, maximum: 10)
    _interface._setYAxis(minimum: 0, maximum: 10)
}
