import UIKit

public enum Symbol {
    case circle, square, diamond, triangle, x, plus
}

extension Symbol {
    var unitPath: UIBezierPath {
        let path: UIBezierPath
        switch self {
        case .circle:
            path = UIBezierPath(ovalIn: CGRect(x: -0.5, y: -0.5, width: 1, height: 1))
        case .square:
            path = UIBezierPath(rect: CGRect(x: -0.5, y: -0.5, width: 1, height: 1))
        case .diamond:
            path = UIBezierPath()
            path.move(to: CGPoint(x:0, y: 0.5))
            path.addLine(to: CGPoint(x: 0.5, y: 0))
            path.addLine(to: CGPoint(x: 0, y: -0.5))
            path.addLine(to: CGPoint(x: -0.5, y: 0))
            path.close()
        case .triangle:
            path = UIBezierPath()
            path.move(to: CGPoint(x: -0.5, y: -1.0 / 3.0))
            path.addLine(to: CGPoint(x: 0, y: 2.0 / 3.0))
            path.addLine(to: CGPoint(x: 0.5, y: -1.0 / 3.0))
            path.close()
        case .plus:
            path = UIBezierPath()
            path.move(to: CGPoint(x: -0.5, y: 0))
            path.addLine(to: CGPoint(x: 0.5, y: 0))
            path.move(to: CGPoint(x: 0, y: -0.5))
            path.addLine(to: CGPoint(x: 0, y: 0.5))
        case .x:
            path = UIBezierPath()
            path.move(to: CGPoint(x: -0.5, y: -0.5))
            path.addLine(to: CGPoint(x: 0.5, y: 0.5))
            path.move(to: CGPoint(x: -0.5, y: 0.5))
            path.addLine(to: CGPoint(x: 0.5, y: -0.5))
        }
        return path
    }
}
