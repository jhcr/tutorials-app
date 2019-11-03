//
//  Logo.swift
//  Tutorials
//
//  Created by JING HE on 10/10/17.
//  Copyright © 2017 Urban Kangaroo Kit. All rights reserved.
//

import UIKit
class UILogo: UIView
{
    override func awakeFromNib() {
        super.awakeFromNib()
        updateView();
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame);
        updateView()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!;
        updateView()
    }
    
    func updateView()
    {
        //let logoView = UIView(frame: CGRect(x:0, y: 0, width: 200, height: 100))
        //self.center = self.view.center
        let logo = UIImageView(frame: CGRect(x:0, y: 0, width: self.frame.size.width, height: self.frame.size.height * 0.7))
        logo.contentMode = UIView.ContentMode.scaleAspectFit
        //logo.center.x = logoView.center.x
        //logo.center.y = 30
        logo.image = UIImage(named:"uk-logo")
        logo.alpha = 1
        self.addSubview(logo)
        
        let labelView = UILabel(frame: CGRect(x:0, y: self.frame.size.height * 0.3, width: self.frame.size.width, height: self.frame.size.height * 0.3));
        //labelView.center.x = logoView.center.x
        //labelView.center.y = 80
        labelView.textAlignment = NSTextAlignment.center
        labelView.text = "URBAN KANGAROO"
        labelView.numberOfLines = 1
        labelView.font = UIFont(name: "Avenir", size: 15.0);
        //labelView.textColor = UIColor(rgb:0xe7e7e7)
        self.addSubview(labelView)
        
        /*let mask = UIView(frame: CGRect(x:0, y: 0, width: 200, height: 200));
         mask.center.x = view.center.x
         mask.backgroundColor = UIColor.white
         */
        //self.view.addSubview(logoView);
        //self.view.addSubview(labelView);
        //self.view.addSubview(mask);
        
        //return logoView
    }
}
