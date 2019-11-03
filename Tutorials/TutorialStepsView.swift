//
//  ToturialStepsView.swift
//  Tutorials
//
//  Created by JING HE on 9/17/17.
//  Copyright © 2017 Urban Kangaroo Kit. All rights reserved.
//

import UIKit

class TutorialStepsView: UIStackView
{
    required override init(frame: CGRect) {
        super.init(frame: frame);
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    init(_ title: String?, _ steps: Array<Step>!)
    {
        self.init();
        self.axis = NSLayoutConstraint.Axis.vertical;
        self.alignment = UIStackView.Alignment.fill;
        self.distribution = UIStackView.Distribution.fill;
        self.contentMode = UIView.ContentMode.scaleToFill;
        self.spacing = 20;
        
        if(title != nil){
            let stackView = UIStackView();
            let itemLabel = UILabel();
            itemLabel.text = title!;
            itemLabel.font = UIFont(name: "Didot-Bold", size: 14.0);
            itemLabel.textAlignment = NSTextAlignment.left;
            stackView.addArrangedSubview(itemLabel);
            stackView.addDefaultMargins();
            self.addArrangedSubview(stackView);
        }
        
        for i in 0..<steps.count
        {
            let stackView = UIStackView();
            stackView.addDefaultMargins();
            stackView.layoutMargins.top = 15
            stackView.layoutMargins.bottom = 0
            self.addArrangedSubview(stackView);
            
            //step detail
            let stepText = UILabel();
            stepText.text = String(i+1) + ". " + steps[i].Text;
            stepText.font = UIFont(name: "Apple SD Gothic Neo", size: 14.0);
            stepText.textAlignment = NSTextAlignment.justified;
            stepText.numberOfLines = 10;
            stepText.lineBreakMode = NSLineBreakMode.byWordWrapping;
            stackView.addArrangedSubview(stepText);
            
            //image view
            if(steps[i].Images != nil && steps[i].Images!.count > 0)
            {
                for j in 0..<steps[i].Images!.count
                {
                    let imageView = UIImageView()//image:UIImage(named: steps[i].Images![j]));
                    imageView.contentMode = UIView.ContentMode.scaleAspectFit;
                    imageView.constraint46();
                    self.addArrangedSubview(imageView);
                    imageView.constraintFullWidthByConstant();
                    imageView.setImage(urlOrNamed:steps[i].Images![j])
                }
            }
            
        }
    }
}


