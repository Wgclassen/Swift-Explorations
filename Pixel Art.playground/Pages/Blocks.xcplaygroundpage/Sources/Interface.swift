import Foundation
import PlaygroundSupport

var _display: PixelDisplay! = nil

public var display: PixelDisplay {
    if _display == nil {
        _display = PixelDisplay(width: 40, height: 40)
        PlaygroundPage.current.liveView = _display
        PlaygroundPage.current.needsIndefiniteExecution = true
    }
        
    return _display
}

extension Array: CustomPlaygroundDisplayConvertible {
    public var playgroundDescription: Any {
        return ()
    }
}
