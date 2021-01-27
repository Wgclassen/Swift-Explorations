import Foundation
import PlaygroundSupport

var _display: PixelDisplay! = nil

public enum DisplaySize: Int {
    case eightByEight = 8
    case twentyByTwenty = 20
    case fortyByForty = 40
    case eightyByEighty = 80
}

public var displaySize = DisplaySize.fortyByForty

public var display: PixelDisplay {
    if _display == nil {
        _display = PixelDisplay(width: displaySize.rawValue, height: displaySize.rawValue)
        PlaygroundPage.current.liveView = _display
        PlaygroundPage.current.needsIndefiniteExecution = true
    }
    
    return _display
}
