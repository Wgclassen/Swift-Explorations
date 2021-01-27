import UIKit

public protocol ChartKeyProviding {
    func addKeyItem(withLabel label: String, color: Color)
}

public struct ChartKeyItem {
    let color: Color
    let name: String
    let symbol: Symbol
    
    public init(color: Color, name: String, symbol: Symbol) {
        self.color = color
        self.name = name
        self.symbol = symbol
    }
    
    public init(color: Color, name: String) {
        self.init(color: color, name: name, symbol: .square)
    }
}

class KeyItemView: UIView {
    
    class SymbolView: UIView {
        var symbol = Symbol.square
        var color = PlatformColor.black
        
        override func draw(_ rect: CGRect) {
            guard let context = UIGraphicsGetCurrentContext() else { return }

            context.setFillColor(PlatformColor.clear.cgColor)
            context.fill(rect)
            
            context.saveGState()

            context.translateBy(x: self.bounds.size.width / 2, y: self.bounds.size.height / 2)
            context.scaleBy(x: self.bounds.size.width, y: self.bounds.size.height)
            context.addPath(symbol.unitPath.cgPath)

            context.restoreGState()
            
            context.saveGState()
            
            context.setFillColor(color.cgColor)
            context.setStrokeColor(color.cgColor)
            
            switch symbol {
            case .x, .plus:
                context.setLineWidth(self.bounds.size.width * 0.1)
                context.strokePath()
            default:
                context.fillPath()
            }
            
            context.restoreGState()
        }
    }
    
    var keyItem: ChartKeyItem
    let colorSwatch: SymbolView
    let label: UILabel
    
    init(item: ChartKeyItem) {
        keyItem = item
        colorSwatch = SymbolView(frame: .zero)
        label = UILabel(frame: .zero)
        colorSwatch.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = item.name
        colorSwatch.color = item.color.platformColor
        colorSwatch.symbol = item.symbol
        colorSwatch.isOpaque = false
        
        super.init(frame: .zero)
        
        self.setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        keyItem = ChartKeyItem(color: .black, name: "Name", symbol: .square)
        colorSwatch = SymbolView(frame: .zero)
        label = UILabel(frame: .zero)
        colorSwatch.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = keyItem.name
        colorSwatch.color = keyItem.color.platformColor

        super.init(coder: aDecoder)
        
        self.setupSubviews()
    }
    
    func setupSubviews() {
        self.addSubview(colorSwatch)
        self.addSubview(label)
        
        self.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-[color]-[label]-|", options: [], metrics: nil, views: ["color": colorSwatch, "label": label]))
        self.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-[color]-|", options: [], metrics: nil, views: ["color": colorSwatch, "label": label]))
        self.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-[label]-|", options: [], metrics: nil, views: ["color": colorSwatch, "label": label]))
//        colorSwatch.addConstraints([NSLayoutConstraint(item: colorSwatch, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)])
//        colorSwatch.addConstraints([NSLayoutConstraint(item: colorSwatch, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)])
        colorSwatch.addConstraints([NSLayoutConstraint(item: colorSwatch, attribute: .height, relatedBy: .equal, toItem: colorSwatch, attribute: .width, multiplier: 1, constant: 0)])

    }
}

public class ChartKeyView: UIView {

    private var stack: UIStackView = {
        let s = UIStackView()
        s.translatesAutoresizingMaskIntoConstraints = false
        s.axis = .vertical
        s.alignment = .leading
        s.distribution = .equalSpacing
        
        return s
    }()
    
    public var keyItems = [ChartKeyItem]() {
        didSet {
            for subview in stack.arrangedSubviews {
                stack.removeArrangedSubview(subview)
                subview.removeFromSuperview()
            }
            
            for item in keyItems {
                stack.addArrangedSubview(KeyItemView(item: item))
            }
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(stack)
        self.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-12-[stack]-12-|", options: [], metrics: nil, views: ["stack": stack]))
        self.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-8-[stack]-8-|", options: [], metrics: nil, views: ["stack": stack]))
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addSubview(stack)
        self.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-0-[stack]-0-|", options: [], metrics: nil, views: ["stack": stack]))
        self.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-0-[stack]-0-|", options: [], metrics: nil, views: ["stack": stack]))
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
    }

}
