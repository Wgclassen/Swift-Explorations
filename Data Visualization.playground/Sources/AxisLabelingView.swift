import UIKit

public enum AxisLabelGravity {
    case top, bottom
}

public enum AxisLabelAttachment {
    case beginning, end
}

public enum AxisLabelDistributionStyle {
    case endToEnd, centeredIntervals
}

class OrientedLabelStack: UIView {
    
    var gravity = AxisLabelGravity.top {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    var attachment = AxisLabelAttachment.beginning {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    var distributionStyle = AxisLabelDistributionStyle.endToEnd {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    var labelAngle = 0.0 {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    var font = UIFont.systemFont(ofSize: 10) {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    var labelValues = [String]() {
        didSet {
            for label in labels {
                label.removeFromSuperview()
            }
            labels.removeAll()
            
            for value in labelValues {
                let label = UILabel()
                label.translatesAutoresizingMaskIntoConstraints = false
                label.font = font
                label.text = value
                
                self.addSubview(label)
                labels.append(label)
            }
            
            self.setNeedsLayout()
        }
    }
    
    private var labels: [UILabel] = [] {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard labels.count > 0 else {
            return
        }
        
        let width = self.bounds.size.width
        
        for (index, label) in labels.enumerated() {
            let size = label.intrinsicContentSize
            label.bounds = CGRect(origin: .zero, size: size)
            
            var y = size.height / 2
            if gravity == .bottom {
                y = self.bounds.size.height - y
            }
            
            if labelAngle == 0 {
                let x: CGFloat
                
                switch distributionStyle {
                case .endToEnd:
                    x = labels.count == 1 ? 0 : (width / CGFloat(labels.count - 1)) * CGFloat(index)
                case .centeredIntervals:
                    x = width / CGFloat(labels.count) * (CGFloat(index) + 0.5)
                }
                
                label.layer.position = CGPoint(x: x, y: y)
            } else {
                switch attachment {
                case .beginning:
                    label.layer.anchorPoint = CGPoint(x: 0.0, y: 0.5)
                case .end:
                    label.layer.anchorPoint = CGPoint(x: 1.0, y: 0.5)
                }
                
                let angle: CGFloat
                
                switch gravity {
                case .top:
                    angle = attachment == .beginning ? CGFloat(labelAngle) : -CGFloat(labelAngle)
                case .bottom:
                    angle = attachment == .beginning ? -CGFloat(labelAngle) : CGFloat(labelAngle)
                }
                
                label.transform = CGAffineTransform(rotationAngle: angle)
                
                let x: CGFloat
                
                switch distributionStyle {
                case .endToEnd:
                    x = labels.count == 1 ? 0 : (width / CGFloat(labels.count - 1)) * CGFloat(index)
                case .centeredIntervals:
                    x = width / CGFloat(labels.count) * (CGFloat(index) + 0.5)
                }
                
                label.layer.position = CGPoint(x: x, y: y)
            }
        }
    }
    
}

class AxisLabelContainerView: UIView {
    
    enum Orientation {
        case horizontal, vertical
    }
    
    let orientation: Orientation
    let min: UILabel
    let max: UILabel
    
    override convenience init(frame: CGRect) {
        self.init(orientation: .horizontal)
    }
    
    init(orientation: Orientation) {
        min = UILabel()
        max = UILabel()
        self.orientation = orientation
        
        super.init(frame: .zero)
        
        min.translatesAutoresizingMaskIntoConstraints = false
        max.translatesAutoresizingMaskIntoConstraints = false
        min.font = UIFont.systemFont(ofSize: 10)
        max.font = UIFont.systemFont(ofSize: 10)
        if orientation == .vertical {
            min.transform = CGAffineTransform(rotationAngle: -.pi / 2)
            max.transform = CGAffineTransform(rotationAngle: -.pi / 2)
        }
        
        self.addSubview(min)
        self.addSubview(max)
        max.layer.anchorPoint = CGPoint(x: 1, y: 0.5)
        min.layer.anchorPoint = CGPoint(x: 0, y: 0.5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if orientation == .vertical {
            max.center = CGPoint(x: self.bounds.origin.x + self.bounds.size.width / 2, y: self.bounds.origin.y)
            min.center = CGPoint(x: self.bounds.origin.x + self.bounds.size.width / 2, y: self.bounds.size.height)
        } else {
            min.center = CGPoint(x: 0, y: self.bounds.size.height / 2)
            max.center = CGPoint(x: self.bounds.size.width, y: self.bounds.size.height / 2)
        }
    }
}

