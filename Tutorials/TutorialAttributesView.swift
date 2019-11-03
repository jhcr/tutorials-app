//
//  TutorialAttributesView.swift
//  Tutorials
//
//  Created by JING HE on 9/17/17.
//  Copyright © 2017 Urban Kangaroo Kit. All rights reserved.
//


import UIKit

class TutorialAttributesView: UIStackView
{
    required override init(frame: CGRect) {
        super.init(frame: frame);
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    convenience init(time: String?, yield: String?, difficulty: Difficulty?, size: Size?)
    {
        self.init();
        self.axis = NSLayoutConstraint.Axis.horizontal;
        self.alignment = UIStackView.Alignment.fill;
        self.distribution = UIStackView.Distribution.equalSpacing;
        self.contentMode = UIView.ContentMode.scaleToFill;
        self.spacing = 30;
        self.addPercentMargins(percent: 0.1, min: nil, max: 20);
        
        if (time != nil) {
            self.addTimeAttributeView(time!);
        }
        if (difficulty != nil)
        {
            self.addDifficultyAttributeView(difficulty!);
        }
        if (yield != nil) {
            self.addYieldAttributeView(yield!);
        }
        /*
        if(size != nil)
        {
            self.addSizeAttributeView(size!);
        }*/
        
        
    }
    
    func addTimeAttributeView(_ time: String)
    {
        let stackView = UIStackView();
        stackView.axis = NSLayoutConstraint.Axis.vertical;
        stackView.alignment = UIStackView.Alignment.center;
        stackView.distribution = UIStackView.Distribution.fill;
        stackView.contentMode = UIView.ContentMode.scaleToFill;
        stackView.spacing = 10;
        
        let imageLabel = UILabel();
        imageLabel.text = "";
        imageLabel.font = UIFont(name: "FontAwesome", size: 36.0);
        imageLabel.textAlignment = NSTextAlignment.center;
        stackView.addArrangedSubview(imageLabel);
        
        let attributeLabel = UILabel();
        attributeLabel.text = time;
        attributeLabel.font = UIFont(name: "Apple SD Gothic Neo", size: 13.0);
        attributeLabel.textAlignment = NSTextAlignment.center;
        stackView.addArrangedSubview(attributeLabel);
        
        self.addArrangedSubview(stackView);
    }
    
    func addYieldAttributeView(_ yield: String)
    {
        let stackView = UIStackView();
        stackView.axis = NSLayoutConstraint.Axis.vertical;
        stackView.alignment = UIStackView.Alignment.center;
        stackView.distribution = UIStackView.Distribution.fill;
        stackView.contentMode = UIView.ContentMode.scaleToFill;
        stackView.spacing = 10;
        
        let imageLabel = UILabel();
        imageLabel.text = "YIELD";
        imageLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 15.0);
        imageLabel.textAlignment = NSTextAlignment.center;
        stackView.addArrangedSubview(imageLabel);
        
        let attributeLabel = UILabel();
        attributeLabel.text = yield;
        attributeLabel.font = UIFont(name: "Apple SD Gothic Neo", size: 13.0);
        attributeLabel.textAlignment = NSTextAlignment.center;
        stackView.addArrangedSubview(attributeLabel);
        
        self.addArrangedSubview(stackView);
    }
    
    func addDifficultyAttributeView(_ difficulty: Difficulty)
    {
        let stackView = UIStackView();
        stackView.axis = NSLayoutConstraint.Axis.vertical;
        stackView.alignment = UIStackView.Alignment.center;
        stackView.distribution = UIStackView.Distribution.fill;
        stackView.contentMode = UIView.ContentMode.scaleToFill;
        stackView.spacing = 10;
        
        let imageLabel = UILabel()
        let attribute = NSMutableAttributedString.init(string: "");
        switch difficulty {
        case Difficulty.Easy:
            attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.lightGray, range: NSRange(location: 1,length: 2));
            imageLabel.attributedText = attribute;
        case Difficulty.Medium:
            attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.lightGray, range: NSRange(location: 2,length: 1));
            imageLabel.attributedText = attribute;
        case Difficulty.Advantage:
            imageLabel.text = ""
        default:
            imageLabel.text = ""
        }
        
        imageLabel.font = UIFont(name: "FontAwesome", size: 18.0);
        imageLabel.textAlignment = NSTextAlignment.center;
        stackView.addArrangedSubview(imageLabel);
        
        let attributeLabel = UILabel();
        attributeLabel.text = difficulty.rawValue;
        attributeLabel.font = UIFont(name: "Apple SD Gothic Neo", size: 13.0);
        attributeLabel.textAlignment = NSTextAlignment.center;
        stackView.addArrangedSubview(attributeLabel);
        
        self.addArrangedSubview(stackView);
    }
    
    func addSizeAttributeView(_ size: Size)
    {
        let stackView = UIStackView();
        stackView.axis = NSLayoutConstraint.Axis.vertical;
        stackView.alignment = UIStackView.Alignment.center;
        stackView.distribution = UIStackView.Distribution.fill;
        stackView.contentMode = UIView.ContentMode.scaleToFill;
        stackView.spacing = 10;
        
        let imageLabel = UILabel();
        switch size {
        case Size.Mini:
            imageLabel.text = ""
        case Size.SmallGroup:
            imageLabel.text = ""
        case Size.Party:
            imageLabel.text = ""
        default:
            imageLabel.text = ""
        }
        imageLabel.font = UIFont(name: "FontAwesome", size: 18.0);
        imageLabel.textAlignment = NSTextAlignment.center;
        stackView.addArrangedSubview(imageLabel);
        
        let attributeLabel = UILabel();
        attributeLabel.text = size.rawValue;
        attributeLabel.font = UIFont(name: "Apple SD Gothic Neo", size: 13.0);
        attributeLabel.textAlignment = NSTextAlignment.center;
        stackView.addArrangedSubview(attributeLabel);
        
        self.addArrangedSubview(stackView);
    }
}
