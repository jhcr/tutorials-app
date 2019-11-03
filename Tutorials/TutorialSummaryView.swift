//
//  TutorialSummaryView.swift
//  Tutorials
//
//  Created by JING HE on 9/18/17.
//  Copyright © 2017 Urban Kangaroo Kit. All rights reserved.
//

import UIKit

class TutorialSummaryView: UIStackView
{
    required override init(frame: CGRect) {
        super.init(frame: frame);
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    init(_ title: String?, _ summary: String?)
    {
        self.init();
        self.setVerticalFill();
        self.addDefaultMargins();
        self.spacing = 20;

        if(title != nil){
            let titleLabel = UILabel();
            titleLabel.text = title!;
            titleLabel.font = UIFont(name: "Didot-Bold", size: 15.0);
            titleLabel.textAlignment = NSTextAlignment.left;
            self.addArrangedSubview(titleLabel);
        }
        
        if(summary != nil){
            let summaryText = UILabel();
            summaryText.text = summary;
            summaryText.font = UIFont(name: "Apple SD Gothic Neo", size: 14.0);
            summaryText.textAlignment = NSTextAlignment.justified;
            summaryText.lineBreakMode = NSLineBreakMode.byWordWrapping;
            summaryText.numberOfLines = 10;
            self.addArrangedSubview(summaryText);
        }
    }
}

