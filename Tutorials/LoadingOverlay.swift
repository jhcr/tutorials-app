//
//  LoadingOverlay
//  Tutorials
//
//  Created by JING HE on 10/5/17.
//  Copyright © 2017 Urban Kangaroo Kit. All rights reserved.
//

import UIKit
public class LoadingOverlay {
    
    var overlayView : UIView!
    var activityIndicator : UIActivityIndicatorView!
    var messageView: UILabel!
    
    class var shared: LoadingOverlay {
        struct Static {
            static let instance: LoadingOverlay = LoadingOverlay()
        }
        return Static.instance
    }
    
    init(){
        self.overlayView = UIView()
        self.activityIndicator = UIActivityIndicatorView()
        
        overlayView.frame = CGRect(x: 0, y: 0, width: 200, height: 80)
        //overlayView.backgroundColor = UIColor(white: 1, alpha: 0.7)
        overlayView.backgroundColor = .clear
        overlayView.clipsToBounds = true
        overlayView.layer.cornerRadius = 10
        overlayView.layer.zPosition = 1
        
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        //activityIndicator.center = CGPoint(x: overlayView.bounds.width / 2, y: overlayView.bounds.height / 2)
        activityIndicator.style = .gray
        activityIndicator.color = .gray
        overlayView.addSubview(activityIndicator)
        
        messageView = UILabel(frame: CGRect(x:50, y: 0, width: 150, height: 40));
        //labelView.center.x = logoView.center.x
        //labelView.center.y = 80
        messageView.textAlignment = NSTextAlignment.left
        messageView.numberOfLines = 1
        messageView.font = UIFont(name: "Avenir", size: 13.0);
        messageView.textColor = UIColor(rgb:0x5d5d5d)
        overlayView.addSubview(messageView)
    }
    
    public func show(view: UIView, fullView: Bool = false) {
        if fullView {
            overlayView.frame = view.bounds
            overlayView.center.y = view.center.y
            activityIndicator.center = overlayView.center
            messageView.center.x = overlayView.center.x
            messageView.center.y = overlayView.center.y + 50
        }
        else{
            overlayView.frame = CGRect(x: 8, y: 40, width: 200, height: 20)
            activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 20)
            messageView.frame = CGRect(x: 40, y: 0, width: 160, height: 20)
        }
        //overlayView.center = view.center
        //activityIndicator.center = overlayView.center
        activityIndicator.color = .black
        view.addSubview(overlayView)
        activityIndicator.startAnimating()
    }
    
    public func showMessage(message: String) {
        messageView.text = message
    }
    public func hideMessage() {
        messageView.text = ""
    }
    
    public func hide() {
       // UIView.animate(withDuration: 0.5,  delay: 0.5, options: .curveEaseInOut, animations: {
            self.hideMessage()
            self.activityIndicator.stopAnimating()
            self.overlayView.removeFromSuperview()
        
       // })
    }
}
/*
public class LoadingOverlay {
    
    var overlayView : UIView!
    var activityIndicator : UIView!
    var timer: Timer?
    var mask: UIView!
    class var shared: LoadingOverlay {
        struct Static {
            static let instance: LoadingOverlay = LoadingOverlay()
        }
        return Static.instance
    }
    
    init(){
        self.overlayView = UIView()
        self.activityIndicator = UILogo(frame:CGRect(x: 0, y: 0, width: 200, height: 100))
        //self.mask = UIView(frame:self.activityIndicator.frame)
        //self.mask.backgroundColor = UIColor.white
        //self.mask.alpha = 1
        //overlayView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        overlayView.backgroundColor = UIColor(white: 1, alpha: 0)
        //overlayView.backgroundColor = .clear
        overlayView.clipsToBounds = true
        overlayView.layer.cornerRadius = 10
        overlayView.layer.zPosition = 1
        
        //activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        //activityIndicator.center = CGPoint(x: overlayView.bounds.width / 2, y: overlayView.bounds.height / 2)
        //activityIndicator.activityIndicatorViewStyle = .whiteLarge
        //activityIndicator.color = .gray
        overlayView.addSubview(activityIndicator)
       // overlayView.addSubview(mask)
    }
    
    public func show(view: UIView) {
        overlayView.frame = view.bounds
        overlayView.center = view.center
        overlayView.backgroundColor = UIColor(white: 1, alpha: 0)
        activityIndicator.center = overlayView.center
        //mask.center = overlayView.center
        view.addSubview(overlayView)
        //activityIndicator.startAnimating()
        timer = startAnimating()
    }
    
    
    @objc func alphaChange()
    {
        UIView.animate(withDuration: 1,  delay: 0, options: .curveEaseInOut, animations: {
            self.mask.alpha = 0
        })
        UIView.animate(withDuration: 2,  delay:1, options: .curveEaseInOut, animations: {
            self.mask.alpha = 1
        })

    }
    
    func startAnimating() -> Timer {
        stopAnimating()
        timer = Timer.scheduledTimer(withTimeInterval: 0.0,  repeats: true, block: {(timer) in
           /* var rotationAnimation: CABasicAnimation = CABasicAnimation(keyPath: "alpha")
            rotationAnimation.fromValue = 1
            rotationAnimation.toValue = 0
            rotationAnimation.duration = 14.0
            rotationAnimation.isRemovedOnCompletion = false
            self.activityIndicator.layer.add(rotationAnimation, forKey: nil)
            
            var rotationAnimation1: CABasicAnimation = CABasicAnimation(keyPath: "alpha")
            rotationAnimation1.fromValue = 0
            rotationAnimation1.toValue = 1
            rotationAnimation1.duration = 4.0
            rotationAnimation1.isRemovedOnCompletion = false
            self.activityIndicator.layer.add(rotationAnimation1, forKey: nil)*/
        })
        timer?.fire()
        return timer!
    }
    
    func stopAnimating() {
        timer?.invalidate()
        
    }
    public func hide() {
        UIView.animate(withDuration: 0.5,  delay: 0.5, options: .curveEaseInOut, animations: {
            self.stopAnimating()
            self.overlayView.removeFromSuperview()
        })
    }
}*/
