//
//  Splitter.swift
//  Tutorials
//
//  Created by JING HE on 9/18/17.
//  Copyright © 2017 Urban Kangaroo Kit. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

class StackView: UIStackView {
    private var color: UIColor?
    override var backgroundColor: UIColor? {
        get { return color }
        set {
            color = newValue
            self.setNeedsLayout()
        }
    }
    
    private lazy var backgroundLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        self.layer.insertSublayer(layer, at: 0)
        return layer
    }()
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundLayer.path = UIBezierPath(rect: self.bounds).cgPath
        backgroundLayer.fillColor = self.backgroundColor?.cgColor
    }
}

class Splitter: UILabel {
    private var color: CGColor?;
    
    override func awakeFromNib() {
        update();
    }
    
    required override init(frame: CGRect)
    {
        super.init(frame: frame);
        self.update();
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        self.update();
    }
    
    convenience init(_ color: CGColor)
    {
        self.init();
        self.color = color;
    }
    
    func update()
    {
        self.text=" ";
    }
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
            
        context!.setLineWidth(1.0)
        context!.move(to: CGPoint(x: 0, y: rect.size.height - 1));
        context!.addLine(to: CGPoint(x: rect.size.width, y: rect.size.height - 1));
        if(self.color != nil)
        {
            context!.setStrokeColor(self.color!);
        }
        else
        {
            context!.setStrokeColor(UIColor.darkGray.cgColor);
        }
        context!.strokePath()
    }
    
}

extension UIStackView {
    @discardableResult func addDefaultMargins() -> UIStackView {
        let m = UIScreen.main.bounds.width * Const.DefaultMarginPercent;
        self.layoutMargins = UIEdgeInsets.init(top: 0, left: m, bottom: 0, right: m);
        self.isLayoutMarginsRelativeArrangement = true;
        return self;
    }
    @discardableResult func addPercentMargins(percent: CGFloat, min: CGFloat?, max: CGFloat?) -> UIStackView {
        var m = UIScreen.main.bounds.width * percent;
        if(min != nil && m < min!)
        {
            m = min!;
        }
        if(max != nil && m > max!)
        {
            m = max!;
        }
        self.layoutMargins = UIEdgeInsets.init(top: 0, left: m, bottom: 0, right: m);
        self.isLayoutMarginsRelativeArrangement = true;
        return self;
    }
    @discardableResult func setVerticalFill() -> UIStackView {
        self.axis = NSLayoutConstraint.Axis.vertical;
        self.alignment = UIStackView.Alignment.fill;
        self.distribution = UIStackView.Distribution.fill;
        self.contentMode = UIView.ContentMode.scaleToFill;
        return self;
    }
    @discardableResult func setHorizontalFill() -> UIStackView {
        self.axis = NSLayoutConstraint.Axis.horizontal;
        self.alignment = UIStackView.Alignment.fill;
        self.distribution = UIStackView.Distribution.fillEqually;
        self.contentMode = UIView.ContentMode.scaleToFill;
        return self;
    }
    
}

extension UIView {
    @discardableResult func setAnchorTo(_ to: UIView) -> UIView {
        let c1 = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: to, attribute: .top, multiplier: 1, constant: 0);
        c1.priority = UILayoutPriority(1000);
        to.addConstraint(c1);
        let c2 = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: to, attribute: .bottom, multiplier: 1, constant: 0);
        c2.priority = UILayoutPriority(1000);
        to.addConstraint(c2);
        let c3 = NSLayoutConstraint(item: self, attribute: .left, relatedBy: .equal, toItem: to, attribute: .left, multiplier: 1, constant: 0);
        c3.priority = UILayoutPriority(1000);
        to.addConstraint(c3);
        let c4 = NSLayoutConstraint(item: self, attribute: .right, relatedBy: .equal, toItem: to, attribute: .right, multiplier: 1, constant: 0);
        c4.priority = UILayoutPriority(1000);
        to.addConstraint(c4);
        
        return self;
    }
    @discardableResult func setAnchorTo(controller: UIViewController) -> UIView {
        let c1 = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: controller.topLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0);
        c1.priority = UILayoutPriority(1000);
        controller.view.addConstraint(c1);
        let c2 = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: controller.bottomLayoutGuide, attribute: .top, multiplier: 1, constant: 0);
        c2.priority = UILayoutPriority(1000);
        controller.view.addConstraint(c2);
        let c3 = NSLayoutConstraint(item: self, attribute: .left, relatedBy: .equal, toItem: controller.view, attribute: .left, multiplier: 1, constant: 0);
        c3.priority = UILayoutPriority(1000);
        controller.view.addConstraint(c3);
        let c4 = NSLayoutConstraint(item: self, attribute: .right, relatedBy: .equal, toItem: controller.view, attribute: .right, multiplier: 1, constant: 0);
        c4.priority = UILayoutPriority(1000);
        controller.view.addConstraint(c4);
        
        return self;
    }

    @discardableResult func constraint46() -> UIView {
        let c = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1.5, constant: 0);
        c.priority = UILayoutPriority(1000);
        self.addConstraint(c);
        return self;
    }
    @discardableResult func constraint11() -> UIView {
        let c = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 0);
        c.priority = UILayoutPriority(1000);
        self.addConstraint(c);
        return self;
    }
    @discardableResult func constraintFullWidthByConstant() -> UIView {
        let c = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0, constant: UIScreen.main.bounds.width);
        c.priority = UILayoutPriority(1000);
        self.addConstraint(c);
        return self;
    }
    @discardableResult func constraintWidth(percent: CGFloat) -> UIView {
        return constraintWidth(self.superview!, percent);
    }
    @discardableResult func constraintHeight(percent: CGFloat) -> UIView {
        return constrainHeight(self.superview!, percent);
    }
    @discardableResult func constraintWidth() -> UIView {
        return constraintWidth(self.superview!, CGFloat(Const.WidthPercent));
    }
    @discardableResult func constraintWidth(toItem: UIView) -> UIView {
        return constraintWidth(toItem, CGFloat(Const.WidthPercent));
    }
    /*@discardableResult func constraintWidth(_ toItem: UIView, _ percent: CGFloat) -> UIView {
        while let i = self.constraints.index(where:{c in (c.firstItem as! NSObject == toItem || c.secondItem as! NSObject == toItem) && (c.firstAttribute == NSLayoutAttribute.trailing && c.secondAttribute == NSLayoutAttribute.trailing) || (c.firstAttribute == NSLayoutAttribute.leading && c.secondAttribute == NSLayoutAttribute.leading)})
        {
            self.removeConstraint(self.constraints[i]);
        }
        
        let c = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: toItem, attribute: .leading, multiplier: percent, constant: 0);
        c.priority = UILayoutPriority(1000);
        toItem.addConstraint(c);
        let c1 = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: toItem, attribute: .trailing, multiplier: percent, constant: 0);
        c1.priority = UILayoutPriority(1000);
        toItem.addConstraint(c1);
        return self;
    }*/
    @discardableResult func constrainHeight(_ toItem: UIView, _ percent: CGFloat) -> UIView {
        let c = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: toItem, attribute: .height, multiplier: percent/100, constant: 0);
        c.priority = UILayoutPriority(1000);
        toItem.addConstraint(c);
        //toItem.contentMode = UIViewContentMode.center;
        return self;
    }
   @discardableResult func constraintWidth(_ toItem: UIView, _ percent: CGFloat) -> UIView {
    let c = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: toItem, attribute: .width, multiplier: percent/100, constant: 0);
        c.priority = UILayoutPriority(1000);
        toItem.addConstraint(c);
        //toItem.contentMode = UIViewContentMode.center;
        return self;
    }
    @discardableResult func addRightBorder(color: UIColor, width: CGFloat) -> UIView {
        let layer = CALayer()
        layer.borderColor = color.cgColor
        layer.borderWidth = width
        layer.frame = CGRect(x: self.frame.size.width-width, y: 0, width: width, height: self.frame.size.height)
        self.layer.addSublayer(layer)
        return self
    }
    @discardableResult func addLeftBorder(color: UIColor, width: CGFloat) -> UIView {
        let layer = CALayer()
        layer.borderColor = color.cgColor
        layer.borderWidth = width
        layer.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
        self.layer.addSublayer(layer)
        return self
    }
    @discardableResult func addTopBorder(color: UIColor, width: CGFloat) -> UIView {
        let layer = CALayer()
        layer.borderColor = color.cgColor
        layer.borderWidth = width
        layer.frame = CGRect(x: 0, y: 0, width: 10000, height: width)
        self.layer.addSublayer(layer)
        return self
    }
    @discardableResult func addBottomBorder(color: UIColor, width: CGFloat) -> UIView {
        let layer = CALayer()
        layer.borderColor = color.cgColor
        layer.borderWidth = width
        layer.frame = CGRect(x: 0, y: self.frame.size.height-width, width: 10000, height: width)
        self.layer.addSublayer(layer)
        return self
    }
}
