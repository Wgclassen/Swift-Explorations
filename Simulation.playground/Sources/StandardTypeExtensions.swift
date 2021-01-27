import Foundation

func +(_ lhs: CGPoint, _ rhs: CGPoint) -> CGPoint {
    return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
}

func -(_ lhs: CGPoint, _ rhs: CGPoint) -> CGPoint {
    return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
}

func *(_ lhs: CGPoint, _ rhs: CGPoint) -> CGPoint {
    return CGPoint(x: lhs.x * rhs.x, y: lhs.y * rhs.y)
}

func *(_ lhs: CGPoint, _ rhs: CGFloat) -> CGPoint {
    return CGPoint(x: lhs.x * rhs, y: lhs.y * rhs)
}

func /(_ lhs: CGPoint, _ rhs: CGPoint) -> CGPoint {
    return CGPoint(x: lhs.x / rhs.x, y: lhs.y / rhs.y)
}

func /(_ lhs: CGPoint, _ rhs: CGFloat) -> CGPoint {
    return CGPoint(x: lhs.x / rhs, y: lhs.y / rhs)
}

func +=(_ lhs: inout CGPoint, _ rhs: CGPoint) {
    lhs.x += rhs.x
    lhs.y += rhs.y
}


extension CGPoint {
    
    init(_ x: Double, _ y: Double) {
        self.init(x: CGFloat(x), y: CGFloat(y))
    }
    
    static func randomNormalizedDirection() -> CGPoint {
        let direction = Double.random(in: 0 ... Double.pi * 2)
        return self.withAngle(direction)
    }
    
    static func withAngle(_ angle: Double) -> CGPoint {
        return CGPoint(x: cos(angle), y: sin(angle))
    }
    
    var angle: Double {
        get {
            var a2 = 0.0
            if y == 0 {
                if x < 0 {
                    a2 = Double.pi
                }
            } else if x == 0 {
                if y > 0 {
                    a2 = Double.pi / 2
                } else {
                    a2 = 3 * Double.pi / 2
                }
            } else {
                a2 = atan(Double(y)/Double(x))
            }
            
            if x < 0 && y != 0 {
                a2 += Double.pi
            } else if x != 0 && y < 0 {
                a2 = Double.pi * 2 + a2
            }
            
            return a2
        }
    }
    
}

extension CGPoint {
    
    func distance(from point: CGPoint) -> Double {
        let dx = x - point.x
        let dy = y - point.y
        return Double((dx * dx + dy * dy).squareRoot())
    }
    
    var normalized: CGPoint {
        get {
            let length = CGFloat(distance(from: .zero))
            return length == 0 ? .zero : CGPoint(x: x / length, y: y / length)
        }
    }
    
}

extension Double {
    
    var clampedToRadians: Double {
        get {
            var new = self
            if new < 0 {
                new += Double.pi * 2
            } else if new > Double.pi * 2 {
                new -= Double.pi * 2
            }
            return new
        }
    }
    
    func deviated(byAngle angle: Double) -> Double {
        let new = self + Double.random(in: -angle ... angle)
        return new.clampedToRadians
    }
}
