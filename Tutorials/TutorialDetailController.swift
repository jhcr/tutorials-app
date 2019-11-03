//
//  TutorialDetailController.swift
//  Tutorials
//
//  Created by JING HE on 9/17/17.
//  Copyright © 2017 Urban Kangaroo Kit. All rights reserved.
//

import UIKit

class TutorialDetailController: UIViewController, UIScrollViewDelegate {
    
    //private var repo: TutorialRepository;
    //private var tutorialId: String?;
    private var tutorial: Tutorial?;
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
       // repo = TutorialRepository.sharedInstance;
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil);
    }
    
    required init?(coder aDecoder: NSCoder) {
       // repo = TutorialRepository.sharedInstance;
        super.init(coder: aDecoder);
    }
    
    convenience init(tutorial: Tutorial)
    {
        self.init();
        self.tutorial = tutorial;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateView()
        //LoadingOverlay.shared.showOverlay(view: self.view)
        /*guard let tid = self.tutorialId else {return}
        repo.GetTutorialAsync(Id: tid) {(tutorial) in
            guard let t = tutorial else {return}
            DispatchQueue.main.async { () -> Void in
                self.updateView(t)
                LoadingOverlay.shared.hideOverlayView()
            }
        }*/
    }
    
    func SetTutorial(_ tutorial: Tutorial)
    {
        self.tutorial = tutorial;
    }
    
 /*   func SetTutorialId(_ tutorialId: String)
    {
        self.tutorialId = tutorialId;
    }
 */
    func updateView()
    {
        guard let tutorial = self.tutorial else {return}

        let scrollView = UIScrollView();
        self.view.addSubview(scrollView);
        scrollView.setAnchorTo(controller: self);
        scrollView.translatesAutoresizingMaskIntoConstraints = false;
        
        let contentView = StackView();
        scrollView.addSubview(contentView);
        scrollView.showsHorizontalScrollIndicator = false;
        
        contentView.setVerticalFill();
        contentView.setAnchorTo(scrollView);
        contentView.constraintWidth(percent: 100.0);
        contentView.translatesAutoresizingMaskIntoConstraints = false;
        contentView.spacing = 20;
        contentView.backgroundColor = UIColor.white

        //header (image, title, feature)
        let headerView = TutorialHeaderView(tutorial);
        contentView.addArrangedSubview(headerView);
        
        //splitter
        let s1 = Splitter(UIColor.lightGray.cgColor)
        contentView.addArrangedSubview(s1);
 
        //summary
        let summaryView = TutorialSummaryView(nil, tutorial.Summary);
        contentView.addArrangedSubview(summaryView);
        
        //splitter
        let s2 = Splitter(UIColor.lightGray.cgColor)
        contentView.addArrangedSubview(s2);

        //attributes
        let attributesView = TutorialAttributesView(time:tutorial.TimeNeeded, yield: tutorial.Yield, difficulty: tutorial.Difficulty, size: tutorial.Size);
        contentView.addArrangedSubview(attributesView);
        
        //splitter
        let s3 = Splitter(UIColor.lightGray.cgColor)
        contentView.addArrangedSubview(s3);
        
        //what we sent
        let sentItemsView = TutorialItemsView("WHAT WE SENT", tutorial.Included);
        contentView.addArrangedSubview(sentItemsView);
        
        //what you need
        let needItemsView = TutorialItemsView("WHAT YOU NEED", tutorial.Demanded);
        contentView.addArrangedSubview(needItemsView);
        
        //step by step
        let stepsView = TutorialStepsView("STEP BY STEP", tutorial.Details);
        contentView.addArrangedSubview(stepsView);
        
        let bottomInset = UIView(frame:CGRect(x:0,y:0,width:1,height:20));
        contentView.addArrangedSubview(bottomInset);

        //go back gesture
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipeRight(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right;
        scrollView.addGestureRecognizer(swipeRight);
        
        /*
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleBackButtonClick(_:)))
        
        let closeButton = UIButton(type: UIButtonType.custom)
        closeButton.frame = CGRect(x:UIScreen.main.bounds.width - 35, y: 30, width:25, height:25)
        closeButton.setImage(UIImage(named:"back1600"), for: UIControlState.normal)
        closeButton.addGestureRecognizer(tapGestureRecognizer)
        self.view.addSubview(closeButton)
         */
        /*
        let backImage = UIImageView(image:UIImage(named:"back1600"))
        backImage.frame = CGRect(x:10, y: 10, width: 25, height: 25)
        backImage.contentMode = UIViewContentMode.scaleAspectFit

        
        backImage.isUserInteractionEnabled = true
        backImage.addGestureRecognizer(tapGestureRecognizer)
        self.view.addSubview(backImage)*/
        //scrollView.scrollsToTop = true;
        //scrollView.bounces = false;
        //scrollView.bouncesZoom = true;
        //pan down gesture
        //let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panGestureAction(_:)))
        //scrollView(panGestureRecognizer)
    }
    
    /*func panGestureAction(_ gestureRecognizer: UIPanGestureRecognizer)
    {
        NSLog("pan")
        let translation = gestureRecognizer.translation(in: view)
        
        if gestureRecognizer.state == .began {
           NSLog("begin")
            theImageOriginalHeight = theImage!.frame.size.height;
        } else if gestureRecognizer.state == .changed {
            NSLog("changed")
            let targetHeight = theImage!.frame.size.height + translation.y;
            if(targetHeight >= self.theImageOriginalHeight!)
            {
                theImage!.frame.size.height = targetHeight;
            }
        } else if gestureRecognizer.state == .ended {
            NSLog("ended")
            UIView.animate(withDuration: 0.2, animations: { self.theImage!.frame.size.height = self.theImageOriginalHeight!;});
        }
    }*/
    /*
    func showAlertButtonTapped() {
        
        // create the alert
        let alert = UIAlertController(title: "UIAlertController", message: "Would you like to continue learning how to use iOS alerts?", preferredStyle: UIAlertControllerStyle.alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
   func scrollViewWillBeginDragging(_ scrollView: UIScrollView)
    {
        //showAlertButtonTapped();
        if(theImageOriginalHeight == nil)
        {
            theImageOriginalHeight = theImage!.frame.size.height;
        }
        let yPos: CGFloat = -scrollView.contentOffset.y
        
        if (yPos > 0) {

            //imgRect.origin.y = scrollView.contentOffset.y
            UIView.animate(withDuration: 0.2, animations: {  //self.theImage!.frame.size.height = self.theImageOriginalHeight! + yPos;
                let r = 1 + yPos / self.theImageOriginalHeight! ;
                self.theImage!.transform = CGAffineTransform(scaleX: r, y: r)
                self.theImage!.frame.origin.x = 0;
                self.theImage!.frame.origin.y = 0;
                scrollView.contentOffset.y = 0;

            },completion:nil);
        }
    }
    */
    @objc func handleSwipeRight(_ gestureRecognizer: UISwipeGestureRecognizer)
    {
       self.back()
    }
    
    func handleBackButtonClick(_ gestureRecognizer: UITapGestureRecognizer)
    {
        self.back()
    }
    
    func back(){
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window!.layer.add(transition, forKey: nil)
        self.dismiss(animated: false, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

