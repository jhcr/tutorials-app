//
//  TutorialListController.swift
//  Tutorials
//
//  Created by JING HE on 9/4/17.
//  Copyright © 2017 Urban Kangaroo Kit. All rights reserved.
//

import UIKit

class TutorialListController: UIViewController, UIScrollViewDelegate {

    //private var repo: TutorialRepository;
    
    var tutorials: [Tutorial]?
    var contentView: StackView?
    //@IBOutlet weak var scrollView: UIScrollView!
    //@IBOutlet weak var contentView: UIStackView!
   
   /* override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        //repo = TutorialRepository.sharedInstance;
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil);

    }
    
    required init?(coder aDecoder: NSCoder) {
        //repo = TutorialRepository.sharedInstance;
        super.init(coder: aDecoder);
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LoadingOverlay.shared.show(view: self.view, fullView: true)
        
        /*let logo = UILogo(frame: CGRect(x:0,y:0,width:200, height: 100))
        logo.center.x = self.view.center.x
        logo.center.y = self.view.center.y - 90
        self.view.addSubview(logo);
         */
        let scrollView = UIScrollView();
        scrollView.delegate = self;
        self.view.addSubview(scrollView);
        scrollView.setAnchorTo(controller: self);
        scrollView.translatesAutoresizingMaskIntoConstraints = false;
        
        contentView = StackView();
        scrollView.addSubview(contentView!);
        scrollView.showsHorizontalScrollIndicator = false;

        contentView!.setVerticalFill();
        contentView!.setAnchorTo(scrollView);
        contentView!.constraintWidth(percent: 100.0);
        contentView!.translatesAutoresizingMaskIntoConstraints = false;
        contentView!.spacing = 20;
        contentView!.backgroundColor = UIColor.white
        
        OperationQueue.current?.addOperation(GetTutorialsOperation(completion: {(tutorialList:[Tutorial]) in
            DispatchQueue.main.async { () -> Void in
                self.refresh(tutorialList)
                //logo.center.y = 80
              //logo.removeFromSuperview()
                LoadingOverlay.shared.hide()
            }
        }))
      /*  repo.GetTutorialListAsync() { (tutorialList) in
            guard let t = tutorialList else {return}
            DispatchQueue.main.async { () -> Void in
                self.updateView(t)
                LoadingOverlay.shared.hideOverlayView()
            }
        }
 */
    }

    
    func refresh(_ tutorialList: Array<Tutorial>?)
    {
        for v:UIView in contentView!.subviews
        {
            v.removeFromSuperview()
        }
        guard let ts = tutorialList else {return}
        self.tutorials = ts

        for t:Tutorial in ts
        {
            let toturialView = TutorialHeaderView(t);
            let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleSingleTap(gestureRecognizer:)))
            toturialView.addGestureRecognizer(gestureRecognizer);

            contentView!.addArrangedSubview(toturialView);
        }
        let bottomInset = UIView(frame:CGRect(x:0,y:0,width:1,height:20));
        contentView!.addArrangedSubview(bottomInset);
    }
    
    @objc func handleSingleTap(gestureRecognizer: UIGestureRecognizer){
       if let tid = (gestureRecognizer.view as! TutorialHeaderView).TutorialId
       {
            let detailView = self.storyboard?.instantiateViewController(withIdentifier: "TutorialDetailView") as! TutorialDetailController
            guard let t = self.tutorials?.first(where: {$0.Id == tid}) else {return}
            detailView.SetTutorial(t)
            self.present(detailView, animated: true, completion: nil)
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView){
        if(scrollView.contentOffset.y == 0) {
            LoadingOverlay.shared.show(view: self.view)
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool){
      // LoadingOverlay.shared.show(view: self.view)
        if (scrollView.contentOffset.y < -60)
       {
            //LoadingOverlay.shared.showMessage(message:"Loading...")
            OperationQueue.current?.addOperation(GetTutorialsOperation(completion: {(tutorialList:[Tutorial]) in
                DispatchQueue.main.async { () -> Void in
                    self.refresh(tutorialList)
                    LoadingOverlay.shared.hide()
                }
            }))
        }
        else { LoadingOverlay.shared.hide()}
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

