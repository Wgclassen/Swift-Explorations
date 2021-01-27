import Foundation
import PlaygroundSupport
import UIKit

public func addWedge(withProportion proportion: Double, color: Color) {
    _interface._addWedge(withProportion: proportion, color: color)
}

public func addKeyItem(withLabel label: String, color: Color) {
    _interface._addKeyItem(withLabel: label, color: color)
}

public func makePieChart() {
    PlaygroundPage.current.liveView = PieChartVisualizationViewController()
}
