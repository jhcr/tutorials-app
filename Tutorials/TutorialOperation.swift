//
//  TutorialOperation.swift
//  Tutorials
//
//  Created by JING HE on 10/7/17.
//  Copyright © 2017 Urban Kangaroo Kit. All rights reserved.
//

import Foundation
//
//  GetTutorialsOperation
//  Tutorials
//
//  Created by JING HE on 10/6/17.
//  Copyright © 2017 Urban Kangaroo Kit. All rights reserved.
//

import Foundation
class GetTutorialsOperation: Operation
{
    let defaultFile: URL
    let completion: (([Tutorial])->Void)?
    var tutorials: [Tutorial]?
    
    init(completion:(([Tutorial])->Void)?)
    {
        self.completion = completion
        self.defaultFile = Bundle.main.url(forResource: "tutorials", withExtension: "json")!
    }
    
    override func main()
    {
        guard !self.isCancelled else {return}
        
        //guard let status = Network.reachability?.status else { return }
            
        //if(status == Network.Status.unreachable) {
        guard (Network.reachability?.isReachable)!
        else {
            if let obj = try? self.getFrom(url: self.defaultFile) { self.tutorials = obj; self.completion?(self.tutorials!); }
            return
        }
            
        // get from internet and refresh cache
        let remoteURL = URL(string: "https://cdn.shopify.com/s/files/1/1461/9402/files/tutorials.json?\(arc4random_uniform(UInt32.max))")
            
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForResource = 29
        config.httpMaximumConnectionsPerHost = 1
        config.requestCachePolicy = NSURLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData
        if #available(iOS 11.0, *) {
            config.waitsForConnectivity = true
        } else {
            // Fallback on earlier versions
        }
        //config.urlCache?.removeAllCachedResponses()
        
        let session = URLSession(configuration: config)
        
        guard !self.isCancelled else {return}
        
        let task = session.downloadTask(with: remoteURL!) {(tempURL: URL?, response: URLResponse?, error: Error?)  in
            
            guard !self.isCancelled else {return}
            
            defer {
                if tempURL != nil
                {
                    try? FileManager.default.removeItem(at: tempURL!)
                }
            }
            
            if error == nil, tempURL != nil, let obj = try? self.getFrom(url: tempURL) { self.tutorials = obj; self.completion?(self.tutorials!); return; }
            
            if let obj = try? self.getFrom(url: self.defaultFile) { self.tutorials = obj; self.completion?(self.tutorials!); return; }

            debugPrint("cannot get tutorial data from remote or local, crashed?")
        }
        task.resume()
    }
    
    func getFrom(url: URL?) throws -> [Tutorial]
    {
        let data = try Data(contentsOf: url!)
        return try JSONDecoder().decode([Tutorial].self, from: data)
    }
    
}
