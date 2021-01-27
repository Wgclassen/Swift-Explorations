import Foundation
import PlaygroundSupport
import UIKit

public func addKeyItem(withLabel label: String, color: Color) {
    _interface._addKeyItem(withLabel: label, color: color)
}

public func addBar(withLength length: Double, color: Color) {
    _interface._addBar(withLength: length, color: color)
}

public func setYAxis(minimum: Double, maximum: Double) {
    _interface._setYAxis(minimum: minimum, maximum: maximum)
}

public func addBarLabel(_ name: String) {
    _interface._addXAxisLabel(name)
}

public func makeBarChart() {
    let vc = BarChartVisualizationViewController()
    PlaygroundPage.current.liveView = vc
}
