//
//  PageControlView.swift
//  Tutorials
//
//  Created by JING HE on 9/11/17.
//  Copyright © 2017 Urban Kangaroo Kit. All rights reserved.
//

import UIKit
class PagingScrollView: UIView, UIScrollViewDelegate
{
    var pageControl: UIPageControl?;
    var scrollView: UIScrollView?;
    var imageResourceNames: Array<String>!
    
    required override init(frame: CGRect) {
        super.init(frame: frame);
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!;
    }
    
    convenience init(_ imageResourceNames: Array<String>)
    {
        self.init();
       // self.delegate = self;
        self.imageResourceNames = imageResourceNames;
        updateView();
    }
    
    func updateView() {
        
        self.scrollView = UIScrollView();
        self.addSubview(scrollView!);
        self.scrollView!.setAnchorTo(self);
        self.scrollView!.delegate = self;
        self.scrollView!.showsVerticalScrollIndicator = false;
        self.scrollView!.showsHorizontalScrollIndicator = false;
        self.scrollView!.bounces = false;

        self.scrollView!.translatesAutoresizingMaskIntoConstraints = false;
        let stackView = UIStackView();
        stackView.setHorizontalFill();
        self.scrollView!.addSubview(stackView);
        stackView.setAnchorTo(self.scrollView!);
        stackView.constraintHeight(percent: 100.0);
        stackView.translatesAutoresizingMaskIntoConstraints = false;
        
        for i in 0..<self.imageResourceNames.count
        {
            let imageView = UIImageView()//image: UIImage(named: self.imageResourceNames[i]));
            stackView.addArrangedSubview(imageView);
            
            imageView.constraint46();
            imageView.contentMode = UIView.ContentMode.scaleAspectFit;
            imageView.setImage(urlOrNamed:self.imageResourceNames[i])
        }
        
        if(stackView.subviews.count == 1)
        {
            self.scrollView!.isScrollEnabled = false;
        }
  
        self.pageControl = UIPageControl();
        self.addSubview(self.pageControl!);
        self.pageControl!.translatesAutoresizingMaskIntoConstraints = false;
  
        let c1 = NSLayoutConstraint(item: self.pageControl!, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: -40);
        c1.isActive = true;
        c1.priority = UILayoutPriority(rawValue: 1000);
        self.addConstraint(c1);
        
        let c2 = NSLayoutConstraint(item: self.pageControl!, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1, constant: 0);
        c2.isActive = true;
        c2.priority = UILayoutPriority(rawValue: 1000);
        self.addConstraint(c2);
        
        self.pageControl!.hidesForSinglePage = true;
        
        self.pageControl!.addTarget(self, action: #selector(self.changePage(sender:)), for: UIControl.Event.valueChanged)
        
        self.pageControl!.numberOfPages = stackView.subviews.count;
        //self.bringSubview(toFront: self.pageControl!);

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateView();
    }
    
    @objc func changePage(sender: AnyObject) {
        let x = CGFloat(pageControl!.currentPage) * self.frame.width;
        self.scrollView?.setContentOffset(CGPoint(x:x, y:0), animated: true);
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x * 1.0 / scrollView.frame.width)
        pageControl!.currentPage = Int(pageNumber);
        changePage(sender: pageControl!);
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool)
    {
        if(!decelerate)
        {
            scrollViewDidEndDecelerating(scrollView);
        }
    }
    
    func handleSwipe(_ gr: UISwipeGestureRecognizer)
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
