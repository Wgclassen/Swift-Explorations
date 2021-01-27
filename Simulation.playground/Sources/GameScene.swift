import SpriteKit

struct PheromoneFieldVisualWindow {
    
    let cellWidthRadius: UInt
    let cellHeightRadius: UInt
    let field: EnvironmentMap!
    
    var bounds: CGRect {
        get {
            return CGRect(origin: CGPoint(x: -CGFloat(cellWidthRadius * field.cellSize) - CGFloat(field.cellSize) / 2,
                                          y: -CGFloat(cellHeightRadius * field.cellSize) - CGFloat(field.cellSize / 2)),
                          size: CGSize(width: CGFloat((cellWidthRadius * 2 + 1) * field.cellSize),
                                       height: CGFloat((cellHeightRadius * 2 + 1) * field.cellSize)))
        }
    }
    
    func locationIsInWindow(_ location: EnvironmentMap.Location) -> Bool {
        return abs(location.x) <= cellWidthRadius && abs(location.y) <= cellHeightRadius
    }
    
    func pixelRect(for location: EnvironmentMap.Location) -> (Int, Int, Int, Int)? {
        guard locationIsInWindow(location) else { return nil }
        
        let topLeft = field.topLeftPosition(of: location) - self.bounds.origin
        let bottomRight = topLeft + CGPoint(x: CGFloat(field.cellSize) - 1, y: CGFloat(field.cellSize) - 1)
        
        return (Int(topLeft.x), Int(topLeft.y), Int(bottomRight.x), Int(bottomRight.y))
    }
    
}

struct DebugSettings {
    var antIDs = false
    var environmentCellStats = false
    var constantTimeStep = 0.0
}

class DebugNode: SKNode {
    var infoLabel: SKLabelNode!
    
    override init() {
        infoLabel = SKLabelNode()
        infoLabel.fontSize = 8
        infoLabel.fontColor = .white
        super.init()
        self.addChild(infoLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

@objc protocol SimulationSceneDelegate: NSObjectProtocol {
    @objc optional func sceneClicked(at: CGPoint)
}

class GameScene: SKScene {
    
    var eventDelegate: SimulationSceneDelegate?
    
    var simulation: AntSimulation! {
        didSet {
            if simulation != nil {
                setupSimulationDisplay()
            }
        }
    }
    
    var debugSettings = DebugSettings() {
        didSet {
            setupDebugging()
        }
    }
    
    var debugNode = SKNode()
    private var environmentCellDebugNodes = [EnvironmentMap.Location:DebugNode]()
    
    private var antNodes = [SKShapeNode]()
    
    private var pheromoneTextureSize: CGSize!
    private var pheromoneTexture: SKMutableTexture!
    private var pheromoneTextureNode: SKSpriteNode!
    private var environmentMapRenderThresholds: [EnvironmentCellValueType:Double] = [.homePheromone: 500, .foragingPheromone: 500, .foodPheromone: 500, .food: 100]
    
    private var pheromoneVisualWindow: PheromoneFieldVisualWindow!
    
    private var lastTime = TimeInterval(0)
    
    func setupSimulationDisplay() {
        guard let view = self.view, let simulation = self.simulation else { return }
        
        // Remove existing display nodes
        for node in antNodes {
            node.removeFromParent()
        }
        antNodes.removeAll()
        pheromoneTextureNode?.removeFromParent()
        
        // Add ant nodes
        for ant in simulation.ants {
            let node = SKShapeNode(circleOfRadius: 2)
            node.fillColor = .red
            node.strokeColor = .red
            node.position = ant.position
            addChild(node)
            antNodes.append(node)
        }
        
        // Set up environment map texture node
        let cellsInView = CGSize(width: view.bounds.size.width / CGFloat(simulation.environmentMap.cellSize),
                                 height: view.bounds.size.height / CGFloat(simulation.environmentMap.cellSize))
        pheromoneVisualWindow = PheromoneFieldVisualWindow(cellWidthRadius: UInt((cellsInView.width - 1) / 2), cellHeightRadius: UInt((cellsInView.height - 1) / 2), field: simulation.environmentMap)
        pheromoneTextureSize = pheromoneVisualWindow.bounds.size
        
        pheromoneTexture = SKMutableTexture(size: pheromoneTextureSize, pixelFormat: Int32(kCVPixelFormatType_32RGBA))
        pheromoneTexture.modifyPixelData { (ptr, length) in
            ptr?.initializeMemory(as: UInt8.self, repeating: 0, count: length)
        }
        
        pheromoneTextureNode = SKSpriteNode(texture: pheromoneTexture, color: .green, size: pheromoneTextureSize)
        pheromoneTextureNode.zPosition = -50
        
        addChild(pheromoneTextureNode)
        pheromoneTextureNode.texture = pheromoneTexture
    }
    
    override func didMove(to view: SKView) {
        setupSimulationDisplay()
    }
    
    @objc static override var supportsSecureCoding: Bool {
        // SKNode conforms to NSSecureCoding, so any subclass going
        // through the decoding process must support secure coding
        get {
            return true
        }
    }
    
    func updatePheromoneTexture() {
        let locations = Set(simulation.environmentMap.concentrations.keys)
        
        pheromoneTexture.modifyPixelData { (ptr, length) in
            guard let pixels = ptr?.bindMemory(to: UInt32.self, capacity: length / 4) else { return }
            for location in locations {
                if location == EnvironmentMap.Location(x: 30, y: 30) {
                    let _ = 0
                }
                
                var value: UInt32 = 0
                if let concentration = self.simulation.environmentMap.concentrations[location], concentration != .zero {
                    value = 0
                    var rotationAmount = 16
                    for type in [EnvironmentCellValueType.homePheromone, EnvironmentCellValueType.foodPheromone, EnvironmentCellValueType.food] {
                        let ratio = Double.minimum(1.0, concentration.amountOf(type) / self.environmentMapRenderThresholds[type]!)
                        let byteValue = UInt32(ratio * Double(UInt8.max))
                        value |= byteValue << rotationAmount
                        rotationAmount -= 8
                    }
                }
                
                if let rect = self.pheromoneVisualWindow.pixelRect(for: location) {
                    for x in rect.0 ... rect.2 {
                        for y in rect.1 ... rect.3 {
                            let offset = Int(self.pheromoneTextureSize.width) * y + x
                            pixels[offset] = value
                        }
                    }
                }
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        let timeDelta = debugSettings.constantTimeStep > 0 ? debugSettings.constantTimeStep : currentTime - lastTime
        lastTime = currentTime
        guard timeDelta < currentTime else { return }
        
        simulation.update(timeDelta: timeDelta)
        
        // Ant visual update (move nodes)
        for pair in zip(simulation.ants, antNodes) {
            pair.1.position = pair.0.position
            pair.1.fillColor = pair.0.isCarryingFood ? .white : .red
        }
        
        updatePheromoneTexture()
        
        // Debug visualization
        if debugSettings.environmentCellStats {
            struct F {
                static let formatter: NumberFormatter = {
                    let formatter = NumberFormatter()
                    formatter.maximumFractionDigits = 0
                    return formatter
                }()
            }
            for (location, contents) in simulation.environmentMap.concentrations {
                environmentCellDebugNodes[location]?.infoLabel.text = F.formatter.string(from: NSNumber(value: contents.amountOf(.homePheromone))) // "\(contents.amountOf(.foodPheromone))"
            }
        }
    }
    
    func setupDebugging() {
        if environmentCellDebugNodes.count == 0 {
            for x in -10 ... 10 {
                for y in -10 ... 10 {
                    let location = EnvironmentMap.Location(x: x, y: y)
                    let point = simulation.environmentMap.centerPosition(of: location)
                    let cellDebugNode = DebugNode()
                    cellDebugNode.position = point
                    environmentCellDebugNodes[location] = cellDebugNode
                    debugNode.addChild(cellDebugNode)
                }
            }
        }
        
        if debugNode.parent == nil && debugSettings.environmentCellStats {
            addChild(debugNode)
        } else {
            debugNode.removeFromParent()
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
    }
    
    func touchMoved(toPoint pos : CGPoint) {
    }
    
    func touchUp(atPoint pos : CGPoint) {
    }
    
    override func mouseDown(with event: NSEvent) {
        touchDown(atPoint: event.location(in: self))
    }
    
    override func mouseDragged(with event: NSEvent) {
        touchMoved(toPoint: event.location(in: self))
    }
    
    override func mouseUp(with event: NSEvent) {
        touchUp(atPoint: event.location(in: self))
        
        eventDelegate?.sceneClicked?(at: event.location(in: self))
    }
    
}
