import Cocoa

public struct Pixel {
    public let x: Int
    public let y: Int
    public let color: Color
    
    public init(x: Int, y: Int, color: Color) {
        self.x = x
        self.y = y
        self.color = color
    }
}

extension Pixel: CustomPlaygroundDisplayConvertible {
    public var playgroundDescription: Any {
        return ()
    }
}

protocol PixelOperationQueue {
    func enqueue(_ operation: @escaping () -> ())
    func enqueue(onMainThread: Bool, _ operation: @escaping () -> ())
    func wait(for time: Double)
}

class SimplePixelOperationQueue: PixelOperationQueue {
    var queue = DispatchQueue(label: "Pixel Operations", qos: .userInteractive, attributes: [], autoreleaseFrequency: .inherit, target: nil)

    func enqueue(_ operation: @escaping () -> ()) {
        enqueue(onMainThread: true, operation)
    }
    
    func enqueue(onMainThread: Bool = false, _ operation: @escaping () -> ()) {
        queue.async {
            if onMainThread {
                DispatchQueue.main.async {
                    operation()
                }
            } else {
                operation()
            }
        }
    }
    
    func wait(for time: Double) {
        queue.async {
            Thread.sleep(forTimeInterval: time)
        }
    }
}

public class ThreadedPixelOperationQueue: PixelOperationQueue {
    func enqueue(onMainThread: Bool, _ operation: @escaping () -> ()) {
        
    }
    
    private var operations = [() -> ()]()
    private var condition = NSCondition()
    private var safe = false
        
    public init() {
    }
    
    private var thread = Thread()
    
    public func start() {
        thread = Thread {
            self.next()
        }
        thread.start()
    }
    
    public func enqueue(_ operation: @escaping () -> ()) {
        safe = false
        operations.append {
            operation()
            self.next()
        }
//        condition.unlock()
        safe = true
        if operations.count == 1 {
//            RunLoop.current.schedule {
//                self.next()
//            }
            print("signal")
            condition.signal()
        }
    }
    
    public func wait(for time: Double) {
//        print(Thread.current)
        enqueue {
            Thread.sleep(forTimeInterval: time)
        }
    }
    
    func next() {
//        RunLoop.main.schedule {
//            if self.operations.count > 0 {
//                let op = self.operations.remove(at: 0)
//                RunLoop.current.schedule {
//                    op()
//                }
//            }
//        }
        print("next")
        condition.lock()
        while (!safe) {
            condition.wait()
        }
        print("safe")
        if operations.count > 0 {
            let op = operations.remove(at: 0)
            RunLoop.current.schedule {
                op()
            }
        }
        condition.unlock()
    }
}

public class PixelDisplay: NSViewController {
    
    var width = 400
    var height = 400
    public var horizontalResolution = 8 {
        didSet {
            setupPixels()
        }
    }
    public var verticalResolution = 8 {
        didSet {
            setupPixels()
        }
    }
    
//    var queue = DispatchQueue(label: "Pixel Operations", qos: .userInteractive, attributes: [], autoreleaseFrequency: .inherit, target: nil)
    let queue: PixelOperationQueue = SimplePixelOperationQueue()
    let appearedWaitQueue = DispatchQueue(label: "Appear")
    let waitSemaphore = DispatchSemaphore(value: 0)
    
    public var backgroundColor = Color.black {
        didSet {
            clear(includingSetPixels: false)
        }
    }
    
    struct CoordPair: Hashable {
        let x: Int
        let y: Int
    }
    var setPixels = Set<CoordPair>()
    
    var baseLayer: CALayer?
    var pixels = [[CALayer]]()
    
    let appearedSemaphore = DispatchSemaphore(value: 0)
    
    public init(width: Int, height: Int) {
        var (w, h) = (width, height)
        if !(w > 0 && h > 0) {
            w = 8
            h = 8
        }
        
        self.horizontalResolution = w
        self.verticalResolution = h
        
        super.init(nibName: nil, bundle:nil)
    }
    
    public convenience init() {
        self.init(width: 8, height: 8)
    }
    
    required convenience init?(coder: NSCoder) {
        self.init()
    }

    override convenience init(nibName nibNameOrNil: NSNib.Name?, bundle nibBundleOrNil: Bundle?) {
        self.init()
    }

    public override func loadView() {
        let v = NSView(frame: NSRect(x: 0, y: 0, width: width, height: height))
        view = v
        
        baseLayer = CALayer()
        baseLayer!.backgroundColor = NSColor.blue.cgColor

        v.layer = baseLayer!

        setupPixels()
        
        queue.enqueue(onMainThread: false) {
            self.appearedSemaphore.wait()
            Thread.sleep(forTimeInterval: 0.5)
        }
    }
    
    public override func viewDidAppear() {
        appearedWaitQueue.async {
            self.appearedSemaphore.signal()
        }
    }
    
    public func setupPixels() {
        guard let baseLayer = baseLayer else { return }
        
        for column in pixels {
            for pixel in column {
                pixel.removeFromSuperlayer()
            }
        }
        
        pixels.removeAll()
        
        for x in 0..<horizontalResolution {
            pixels.append([])
            for y in 0..<verticalResolution {
                let pixel = CALayer()
                pixel.frame = CGRect(x: Double(x) * Double(width) / Double(horizontalResolution),
                                     y: Double(y) * Double(height) / Double(verticalResolution),
                                     width: Double(width) / Double(horizontalResolution),
                                     height: Double(height) / Double(verticalResolution))
                pixels[x].append(pixel)
                baseLayer.addSublayer(pixel)
            }
        }
        
        clear()
    }
    
    public func clear() {
        clear(includingSetPixels: true)
    }
    
    public func clear(includingSetPixels: Bool) {
        let colorForClear = self.backgroundColor.cgColor
        queue.enqueue {
            CATransaction.begin()
            CATransaction.setDisableActions(true)
            for x in 0..<self.horizontalResolution {
                for y in 0..<self.verticalResolution {
                    if includingSetPixels || !self.setPixels.contains(CoordPair(x: x, y: y)) {
                        self.pixels[x][y].backgroundColor = colorForClear
                    }
                }
            }
            CATransaction.commit()
            
            if includingSetPixels {
                self.setPixels.removeAll()
            }
        }
    }
    
    public func setPixel(x: Int, y: Int, color: Color) {
        batchSetPixels([Pixel(x: x, y: y, color: color)])
    }
    
    public func clearPixel(x: Int, y: Int) {
        batchClearPixels([Pixel(x: x, y: y, color: .clear)])
    }
    
    public func batchSetPixels(_ pixels: [Pixel]) {
        queue.enqueue {
            CATransaction.begin()
            CATransaction.setDisableActions(true)
            for pixel in pixels {
                guard pixel.x >= 0, pixel.y >= 0, pixel.x < self.horizontalResolution, pixel.y < self.verticalResolution else {
                    print("Warning: Pixel coordinate \(pixel.x), \(pixel.y) out of range; no action taken for this pixel.")
                    continue
                }

                self.pixels[pixel.x][pixel.y].backgroundColor = pixel.color.cgColor
                self.setPixels.insert(CoordPair(x: pixel.x, y: pixel.y))
            }
            CATransaction.commit()
        }
    }
    
    public func batchClearPixels(_ pixels: [Pixel]) {
        queue.enqueue {
            CATransaction.begin()
            CATransaction.setDisableActions(true)
            for pixel in pixels {
                guard pixel.x >= 0, pixel.y >= 0, pixel.x < self.horizontalResolution, pixel.y < self.verticalResolution else {
                    print("Warning: Pixel coordinate \(pixel.x), \(pixel.y) out of range; no action taken for this pixel.")
                    continue
                }

                self.pixels[pixel.x][pixel.y].backgroundColor = self.backgroundColor.cgColor
                self.setPixels.remove(CoordPair(x: pixel.x, y: pixel.y))
            }
            CATransaction.commit()
        }
    }
    
    public func wait(time: Double) {
        queue.wait(for: time)
    }
    
}

extension PixelDisplay: CustomPlaygroundDisplayConvertible {
    public var playgroundDescription: Any {
        return ()
    }
}
