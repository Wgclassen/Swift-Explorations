import Foundation
import PlaygroundSupport
import UIKit

public func addBar(withLength length: Double, color: Color) {
    _interface._addBar(withLength: length, color: color)
}

public func makeBarChart() {
    let vc = BarChartVisualizationViewController()
    PlaygroundPage.current.liveView = vc
    _interface._setYAxis(minimum: 0, maximum: 10)
}
