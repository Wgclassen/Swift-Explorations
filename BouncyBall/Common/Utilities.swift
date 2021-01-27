/*************************************

Do not modify this file.

*************************************/

#if os(iOS)
import UIKit

var viewController: ViewController {
    return UIApplication.shared.windows[0].rootViewController! as! ViewController
}

var scene: ShapeScene {
    return viewController.shapeScene
}
#elseif os(macOS)
import Cocoa

var viewController: ViewController {
    return NSApplication.shared.orderedWindows[0].contentViewController! as! ViewController
}

var scene: ShapeScene {
    return viewController.shapeScene
}
#endif
