//
//  PageControlView.swift
//  Tutorials
//
//  Created by JING HE on 9/11/17.
//  Copyright © 2017 Urban Kangaroo Kit. All rights reserved.
//

import UIKit
class PagingImageView: UIView
{
    var pageControl: UIPageControl?;
    var imageResourceNames: Array<String>!
    
    required override init(frame: CGRect) {
        super.init(frame: frame);
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!;
    }
    
    init(_ imageResourceNames: Array<String>, _ frame: CGRect)
    {
        super.init(frame: frame);
        self.imageResourceNames = imageResourceNames;
        updateView();
    }
    
    func updateView() {
        
       // let stackView = UIStackView();
       // stackView.setHorizontalFill();
      //  self.addSubview(stackView);
      //  stackView.setAnchorTo(self);
        /*let c1 = NSLayoutConstraint(item: stackView, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0);
        c1.priority = UILayoutPriority(888);
        self.addConstraint(c1);*/
        let imageView = UIImageView();
        self.addSubview(imageView);
        self.contentMode = UIView.ContentMode.scaleAspectFill;
        imageView.isUserInteractionEnabled = true;
        imageView.image = UIImage(named: self.imageResourceNames[0]);
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
       /* for i in 0..<self.imageResourceNames.count
        {
            let imageView = UIImageView(image: UIImage(named: self.imageResourceNames[i]));
            
            //imageView.frame.size.width = width;
            //imageView.frame.origin.x = width * CGFloat(i);
            //imageView.frame.origin.y = 0;

            imageView.constraint46();
            imageView.contentMode = UIViewContentMode.scaleAspectFit;
            
            //stackView.addArrangedSubview(imageView);
        }*/
        
        /*if(self.subviews.count == 0)
        {
            self.addSubview(UIImageView(image: UIImage(named: Const.SampleImage)));
        }*/
        
       /* if(stackView.subviews.count == 1)
        {
            self.isScrollEnabled = false;
        }
        stackView.frame.size = CGSize(width:self.frame.width * CGFloat(self.imageResourceNames.count),height: self.frame.height);
*/
       // self.contentSize = stackView.frame.size;
    /*  self.addConstraint(NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: self.subviews[0], attribute: NSLayoutAttribute.height, multiplier: 1, constant: 0));
     */
        self.pageControl = UIPageControl(frame: CGRect(x:0,y: self.frame.height - 50, width: self.frame.width, height:50));
    
        self.pageControl!.hidesForSinglePage = true;
        
        self.pageControl!.addTarget(self, action: #selector(self.changePage(sender:)), for: UIControl.Event.valueChanged)
        self.addSubview(self.pageControl!);
        
        self.pageControl!.numberOfPages = self.imageResourceNames.count;
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipe(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.addGestureRecognizer(swipeRight);
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipe(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.addGestureRecognizer(swipeLeft);

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateView();
    }
    
    @objc func changePage(sender: AnyObject) {
        let newImageView = UIImageView(image: UIImage(named: self.imageResourceNames[self.pageControl!.currentPage]));
        newImageView.frame.size = frame.size;
        newImageView.frame.origin.x = -frame.width;
        self.addSubview(newImageView);
        UIView.animate(withDuration: 1,  delay: 0, options: .curveEaseInOut, animations: {
            newImageView.frame.origin.x = 0;
            self.subviews[0].frame.origin.x = self.frame.width;

                    },completion:
         { (finished) -> Void in
                self.subviews[0].removeFromSuperview();
          
            });

    }
    
    @objc func handleSwipe(_ gr: UISwipeGestureRecognizer)
    {
        if(gr.direction == UISwipeGestureRecognizer.Direction.left)
        {
            if( self.pageControl!.currentPage > 0)
            {
                self.pageControl!.currentPage -= 1;
                changePage(sender: self.pageControl!);
            }
        }
        else if(gr.direction == UISwipeGestureRecognizer.Direction.right)
        {
            if( self.pageControl!.currentPage < self.imageResourceNames.count)
            {
                self.pageControl!.currentPage += 1;
                changePage(sender: self.pageControl!);
            }
        }
    }

}
