//
//  ImageOperation.swift
//  Tutorials
//
//  Created by JING HE on 10/8/17.
//  Copyright © 2017 Urban Kangaroo Kit. All rights reserved.
//
import Foundation

class GetImageOperation: Operation
{
    typealias ImageCacheCompletion = (Data) -> Void
    let completion: ImageCacheCompletion?
    let imageURL: String?
    
    init(url: String, completion: ImageCacheCompletion?){
        self.completion = completion
        self.imageURL = url
        super.init()
        
    }
    
    override func main() {
        
        guard !self.isCancelled else {return}
        //guard let status = Network.reachability?.status, status != Network.Status.unreachable else {return }
        
        if let data = ImageQueue.cache.object(forKey: self.imageURL! as AnyObject)
        {
            self.completion?(data as! Data);
            return
        }
        
        if let data = try? Data(contentsOf: (URL(string: self.imageURL!)!))
        {
            ImageQueue.cache.setObject(data as AnyObject, forKey: self.imageURL! as AnyObject, cost: data.count);
            self.completion?(data);
            return
        }
       
        debugPrint("failed to find image in cache or download at \(self.imageURL!)")
    }
   
}



