import Foundation
import PlaygroundSupport
import UIKit

public func addKeyItem(withLabel label: String, color: Color) {
    _interface._addKeyItem(withLabel: label, color: color)
}

public func addPointAt(x: Double, y: Double, color: Color) {
    _interface._addPointAt(x: x, y: y, color: color, size: 5, shape: .circle)
}

public func setXAxis(minimum: Double, maximum: Double) {
    _interface._setXAxis(minimum: minimum, maximum: maximum)
}

public func setYAxis(minimum: Double, maximum: Double) {
    _interface._setYAxis(minimum: minimum, maximum: maximum)
}

public func makePlot() {
    PlaygroundPage.current.liveView = PlotVisualizationViewController()
}
