//
//  ToturialView.swift
//  Tutorials
//
//  Created by JING HE on 9/17/17.
//  Copyright © 2017 Urban Kangaroo Kit. All rights reserved.
//

import UIKit

class TutorialHeaderView: UIStackView
{
    public var TutorialId: String?;
    public var ImageView: UIImageView?;
    
    required override init(frame: CGRect) {
        super.init(frame: frame);
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    init(_ tutorial: Tutorial!)
    {
        self.init();
        self.TutorialId = tutorial.Id;
        self.setVerticalFill()
        self.spacing = 20;
        //image view
       /* if(tutorial.Images.count > 0)
        {
            ImageView = UIImageView(image:UIImage(named: tutorial.Images[0]));
            
        }
        else
        {
            ImageView =  UIImageView(image:UIImage(named: Const.SampleImage));
        }
        ImageView?.contentMode = UIViewContentMode.scaleAspectFit;
        ImageView?.constraint46();
        self.addArrangedSubview(ImageView!);
 */
        let pagingImageView = PagingScrollView(tutorial.Images);//PagingScrollView(tutorial.Images, CGRect(x: 0,y:0,width:UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * 2/3));
        self.addArrangedSubview(pagingImageView);
        pagingImageView.constraint46();
       // pagingImageView.constraintWidth(percent: 100.0);

        /*let c1 = NSLayoutConstraint(item: pagingImageView, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0);
        c1.priority = UILayoutPriority(1000);
        self.addConstraint(c1);
*/

        
        let stackView = UIStackView();
        stackView.addDefaultMargins();
        stackView.layoutMargins.top = 0
        stackView.layoutMargins.bottom = 10
        stackView.setVerticalFill();
        stackView.spacing = 10;
        //title
        let titleLabel = UILabel();
        titleLabel.text = tutorial.Title;
        titleLabel.font = UIFont(name: "Didot-Bold", size: 20.0);
        titleLabel.textAlignment = NSTextAlignment.center;
        stackView.addArrangedSubview(titleLabel);
        //feature
        let featureLabel = UILabel();
        let attribute = NSMutableAttributedString.init(string: tutorial.Feature!);
        
        let s = tutorial.Feature!;
        var searchStartIndex = s.startIndex;
        while searchStartIndex < s.endIndex,
            let range = s.range(of: "and", range: searchStartIndex..<s.endIndex),
            !range.isEmpty
        {
            let index = s.distance(from: s.startIndex, to: range.lowerBound)
            attribute.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: index, length: 3));
            searchStartIndex = range.upperBound;
        }
       // attribute.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.styleSingle.rawValue, range: NSRange(location: 0, length: 4));
        searchStartIndex = s.startIndex;
        while searchStartIndex < s.endIndex,
            let range = s.range(of: "with", range: searchStartIndex..<s.endIndex),
            !range.isEmpty
        {
            let index = s.distance(from: s.startIndex, to: range.lowerBound)
            attribute.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: index, length: 4));
            searchStartIndex = range.upperBound;
        }
        featureLabel.attributedText = attribute;
        featureLabel.font = UIFont(name: "Apple SD Gothic Neo", size: 14.0);
        featureLabel.textAlignment = NSTextAlignment.center;
        featureLabel.lineBreakMode = NSLineBreakMode.byWordWrapping;
        featureLabel.numberOfLines = 2;
        stackView.addArrangedSubview(featureLabel);
        
        self.addArrangedSubview(stackView);
    }
}


