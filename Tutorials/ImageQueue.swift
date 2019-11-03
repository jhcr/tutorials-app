//
//  ImageCache.swift
//  Tutorials
//
//  Created by JING HE on 10/8/17.
//  Copyright © 2017 Urban Kangaroo Kit. All rights reserved.
//

import UIKit

class ImageQueue:  OperationQueue
{
    class ImageCache:  NSCache<AnyObject, AnyObject>
    {
        static var shared: ImageCache = ImageCache()
        
        override init()
        {
            super.init()
            self.name = "com.urbankangarookit.tutorial.images"
          //  self.countLimit = 100
          //  self.totalCostLimit = 20 * 1024
           
        }
    }
    static var shared: ImageQueue = ImageQueue()
    static var cache: ImageCache = ImageCache.shared
    
    override init()
    {
        super.init()
        self.name = "com.urbankangarookit.tutorial.images"
        self.maxConcurrentOperationCount = 1
        self.qualityOfService = QualityOfService.default
    }
}

extension UIImageView
{
    func setImage(urlOrNamed: String)
    {
        if let image = UIImage(named: urlOrNamed) {
            self.image = image; return}
        guard urlOrNamed.lowercased().hasPrefix("http") else {return}
        
        let loadingMask = LoadingOverlay()
        loadingMask.show(view: self, fullView: true)
        ImageQueue.shared.addOperation(GetImageOperation(url: urlOrNamed) {(data: Data) -> Void in
            DispatchQueue.main.async {
                loadingMask.hide()
                UIView.animate(withDuration: 0.5,  delay: 0.5, options: .curveEaseInOut, animations: {
                    self.image = UIImage(data: data)
                })
            }})
    }
}


