import UIKit

public struct PieWedge {
    var proportion: Double
    var color: Color
    var scale: Double
    var offset: Double
    
    public init(proportion: Double, color: Color) {
        self.init(proportion: proportion, color: color, scale: 1, offset: 0)
    }

    public init(proportion: Double, color: Color, scale: Double, offset: Double) {
        self.proportion = proportion
        self.color = color
        self.scale = scale
        self.offset = offset
    }
}

extension PieWedge {
    var outsetEdge: CGFloat {
        get {
            return CGFloat((1 + offset) * scale)
        }
    }
    var outsetCenter: CGFloat {
        get {
            return CGFloat(offset * scale)
        }
    }
}

public enum WedgeLabelDisplayStyle {
    case interior, exterior, none
}

extension Color {
    var suggestedContrastingTextColor: Color {
        get {
            // algorithm from: http://www.w3.org/WAI/ER/WD-AERT/#color-contrast
            let brightness = ((self.red * 299) + (self.green * 587) + (self.blue * 114)) / 1000
            
            if brightness < 0.5 {
                return .white
            }
            else {
                return .black
            }
        }
    }
}

public class PieChartView : UIView {
    
    private var wedgeLayers = [CAShapeLayer]()
    private var labels = [UILabel]()
    
    static let formatter: NumberFormatter = {
        var f = NumberFormatter()
        f.maximumFractionDigits = 1
        f.numberStyle = .percent
        return f
    }()
    
    public var labelDisplayStyle: WedgeLabelDisplayStyle = .interior {
        didSet {
            for (index, wedge) in wedges.enumerated() {
                let label = labels[index]
                switch labelDisplayStyle {
                case .none:
                    label.isHidden = true
                case .exterior:
                    label.isHidden = false
                    label.textColor = (self.backgroundColor == nil) ? .black : Color(wrapped: self.backgroundColor!).suggestedContrastingTextColor.platformColor
                case .interior:
                    label.isHidden = false
                    label.textColor = wedge.color.suggestedContrastingTextColor.platformColor
                }
            }
            self.setNeedsLayout()
        }
    }
    
    public var wedges: [PieWedge] = [] {
        didSet {
            var index = 0
            for wedge in wedges {
                let wedgeLayer: CAShapeLayer
                let labelLayer: UILabel
                if index < oldValue.count {
                    wedgeLayer = wedgeLayers[index]
                    labelLayer = labels[index]
                } else {
                    wedgeLayer = CAShapeLayer()
                    labelLayer = UILabel()
                    labelLayer.translatesAutoresizingMaskIntoConstraints = false
                }
                wedgeLayer.anchorPoint = CGPoint(x: 0, y: 0)
                
                let piePath = CGMutablePath()
                piePath.move(to: .zero)
                piePath.addLine(to: CGPoint(x: 1, y: 0))
                piePath.addRelativeArc(center: .zero, radius: 1, startAngle: 0, delta: .pi * 2 * CGFloat(wedge.proportion))
                piePath.addLine(to: .zero)
                wedgeLayer.path = piePath
                
                wedgeLayer.fillColor = wedge.color.cgColor
                
                labelLayer.font = UIFont.boldSystemFont(ofSize: 12)
                labelLayer.textColor = wedge.color.suggestedContrastingTextColor.platformColor
                labelLayer.textAlignment = .center
                labelLayer.text = PieChartView.formatter.string(from: NSNumber(value: wedge.proportion))
                labelLayer.layer.zPosition = 1
                labelLayer.bounds = CGRect(x: 0, y: 0, width: 50, height: 50)
                
                if index >= oldValue.count {
                    wedgeLayers.append(wedgeLayer)
                    labels.append(labelLayer)

                    self.layer.addSublayer(wedgeLayer)
                    self.addSubview(labelLayer)
                }
                
                index += 1
            }
            
            if wedges.count < wedgeLayers.count {
                for layerToRemove in wedgeLayers[wedges.count...] {
                    layerToRemove.removeFromSuperlayer()
                }
                for labelToRemove in labels[wedges.count...] {
                    labelToRemove.removeFromSuperview()
                }
                
                wedgeLayers.removeLast(wedgeLayers.count - wedges.count)
                labels.removeLast(labels.count - wedges.count)
            }

            self.setNeedsLayout()
        }
    }
    
    private var baseScale: CGFloat {
        guard wedges.count > 0 else {return 0}
        
        let minDimension = CGFloat.minimum(layer.bounds.size.width, layer.bounds.size.height)
        let maxWedgeOffset = wedges.max { (a, b) -> Bool in
            return a.outsetEdge < b.outsetEdge
        }!.outsetEdge
        
        let minDimensionAdjustment: CGFloat = labelDisplayStyle == .exterior ? 25 : 0
        
        return CGFloat(minDimension / 2 - minDimensionAdjustment) / CGFloat(maxWedgeOffset)
    }

    public override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        
        var cumulativeRotation = -CGFloat.pi / 2
        var index = 0
        for wedge in wedges {
            guard index < wedgeLayers.count else { continue }

            let wedgeLayer = wedgeLayers[index]
            CATransaction.begin()
            CATransaction.setDisableActions(true)
            
            // Transformations applied in reverse order:
            wedgeLayer.setAffineTransform(
                    // 6: Translate from the origin to the center of the pie
                    CGAffineTransform(translationX: layer.bounds.size.width / 2, y: layer.bounds.size.height / 2)
                    // 5: Scale the wedge to fit in the chart
                    .scaledBy(x: baseScale * CGFloat(wedge.scale), y: baseScale * CGFloat(wedge.scale))
                    // 4: Rotate to the angle of this wedge in the pie
                    .rotated(by: cumulativeRotation)
                    // 3: Rotate back to zero angle
                    .rotated(by: CGFloat(wedge.proportion * Double.pi))
                    // 2: Translate to the appropriate offset from the center of the pie
                    .translatedBy(x: CGFloat(wedge.offset), y: 0)
                    // 1: Rotate backwards by half the angle of the wedge
                    .rotated(by: -CGFloat(wedge.proportion * Double.pi))
            )

            CATransaction.commit()
            
            cumulativeRotation += CGFloat(wedge.proportion) * .pi * 2
            
            index += 1
        }
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        var cumulativeRotation = -CGFloat.pi / 2
        var index = 0
        for wedge in wedges {
            guard index < labels.count else { continue }

            let labelLayer = labels[index]

            let labelOffset: CGFloat
            switch labelDisplayStyle {
            case .interior:
                labelOffset = baseScale * CGFloat(wedge.scale) * CGFloat(wedge.offset + 0.65)
            case .exterior:
                labelOffset = baseScale * CGFloat(wedge.scale) * CGFloat(wedge.offset + 1) + 14.0
            case .none:
                labelOffset = 0
                continue
            }

            let offsetAngle = CGFloat.pi * CGFloat(wedge.proportion)
            let rotation = cumulativeRotation + offsetAngle
            
            // Make sure transformation operates around the center point of the label.
            labelLayer.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            
            // Transformations applied in reverse order:
            labelLayer.transform =
                // 4: Rotate the translated label into position with the pie wedge; pre-rotation will be cancelled out,
                // leaving the label oriented correctly
                CGAffineTransform(rotationAngle:rotation)
                // 3: Move it over into the wedge from the center of the pie
                .translatedBy(x: labelOffset, y: 0)
                // 2: Pre-rotate the label; it'll be off kilter
                .rotated(by: -rotation)
                // 1: Translate the center of the label to the center of the PieChartView
                .translatedBy(x: self.bounds.size.width / 2 - labelLayer.bounds.size.width / 2, y: self.bounds.size.height / 2 - labelLayer.bounds.size.height / 2)

            cumulativeRotation += CGFloat(wedge.proportion) * .pi * 2

            index += 1
        }
    }
}
