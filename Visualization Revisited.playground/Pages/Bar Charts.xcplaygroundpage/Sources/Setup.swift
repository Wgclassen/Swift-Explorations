import Foundation
import PlaygroundSupport
import UIKit

public var vc = BarChartVisualizationViewController()

public let barChartView: BarChartView = _interface._bar!.barView
public let keyView: ChartKeyView = _interface._bar!.keyView

public func makeBarChart() {
    PlaygroundPage.current.liveView = vc
}
