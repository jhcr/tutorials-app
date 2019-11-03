//
//  TutorialItemsView.swift
//  Tutorials
//
//  Created by JING HE on 9/17/17.
//  Copyright © 2017 Urban Kangaroo Kit. All rights reserved.
//


import UIKit

class TutorialItemsView: UIStackView
{
    required override init(frame: CGRect) {
        super.init(frame: frame);
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    init(_ title: String?, _ items: Array<Item>?)
    {
        self.init();
        self.axis = NSLayoutConstraint.Axis.vertical;
        self.alignment = UIStackView.Alignment.fill;
        self.distribution = UIStackView.Distribution.equalSpacing;
        self.contentMode = UIView.ContentMode.scaleToFill;
        self.spacing = 10;
        self.addPercentMargins(percent: 0.1, min: nil, max: 20);
        
        if(title != nil){
            let itemLabel = UILabel();
            itemLabel.text = title!;
            itemLabel.font = UIFont(name: "Didot-Bold", size: 14.0);
            itemLabel.textAlignment = NSTextAlignment.left;
            self.addArrangedSubview(itemLabel);
        }
        
        if (items != nil) {
            for i in 0..<items!.count
            {
                self.addItemView(items![i]);
            }
        }
        
    }
    
    func addItemView(_ item: Item)
    {
        let stackView = UIStackView();
        stackView.axis = NSLayoutConstraint.Axis.horizontal;
        stackView.alignment = UIStackView.Alignment.fill;
        stackView.distribution = UIStackView.Distribution.fill;
        stackView.contentMode = UIView.ContentMode.scaleToFill;
        stackView.spacing = 20;
        self.addArrangedSubview(stackView);
        
        let imageView = UIImageView()//image: UIImage(named: item.Image));
        imageView.setImage(urlOrNamed: item.Image)
        imageView.contentMode = UIView.ContentMode.scaleAspectFill;
        //imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier:1, constant:0);
        stackView.addArrangedSubview(imageView);
        //imageView.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.25, constant:0);
       // let c1 = NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal, toItem: imageView, attribute: .height, multiplier: 1, constant: 0);
        imageView.contentMode = UIView.ContentMode.scaleAspectFit;
        imageView.constraint11();

        let c2 = NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .lessThanOrEqual, toItem: self, attribute: .width, multiplier:0.12,constant: 0);
        c2.priority = UILayoutPriority(1000);
        self.addConstraint(c2);
        //let c2 = NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal, toItem: stackView, attribute: .width, multiplier: 0.25, constant: 0);
        //c2.priority = UILayoutPriority(1000);
        //imageView.addConstraint(c2);
        
        let itemLabel = UILabel();
        itemLabel.text = item.Name;
        itemLabel.font = UIFont(name: "Apple SD Gothic Neo", size: 13.0);
        itemLabel.textAlignment = NSTextAlignment.left;
        stackView.addArrangedSubview(itemLabel);
    }
}
