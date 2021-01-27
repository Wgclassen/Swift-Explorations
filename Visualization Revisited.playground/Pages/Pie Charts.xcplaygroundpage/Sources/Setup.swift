import Foundation
import PlaygroundSupport
import UIKit

public var vc = PieChartVisualizationViewController()

public let pieChartView: PieChartView = _interface._pie!.pieView
public let keyView: ChartKeyView = _interface._pie!.keyView

public func makePieChart() {
    PlaygroundPage.current.liveView = vc
}
