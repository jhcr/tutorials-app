//
//  GetTutorialsOperation
//  Tutorials
//
//  Created by JING HE on 10/6/17.
//  Copyright © 2017 Urban Kangaroo Kit. All rights reserved.
//
/*
import Foundation
class TutorialOperation
{
    let background: DispatchQueue
    let cacheFile: URL
    let defaultFile: URL
    var tutorials: [Tutorial]?
    
    init()
    {
        background = DispatchQueue(label: "Tutorial queue")
        let cachesFolder = try! FileManager.default.url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        self.cacheFile = cachesFolder.appendingPathComponent("tutorials.json")
        self.defaultFile = Bundle.main.url(forResource: "tutorials", withExtension: "json")!
    }

    public func getAllTutorials(completion: (([Tutorial])->Void)?)
    {
        background.async {
            guard let status = Network.reachability?.status else { return }
            
            if(status == Network.Status.unreachable) {
                do {
                    try self.getFromExisitng()
                }
                catch {
                    debugPrint("Cannot even find default file, crashed?")
                }
                return
            }
           
            // get from internet and refresh cache
            let remoteURL = URL(string: "https://cdn.shopify.com/s/files/1/1461/9402/files/tutorials.json")

            let config = URLSessionConfiguration()
            config.timeoutIntervalForResource = 29
            config.httpMaximumConnectionsPerHost = 1
            let session = URLSession(configuration: config, delegate: nil, delegateQueue: nil)
            let task = session.downloadTask(with: remoteURL!) {(url: URL?, response: URLResponse?, error: Error?)  in
                if let tempURL = url {
                    do{// get from internet
                        try self.getFrom(url: tempURL)
                        do {
                            try FileManager.default.removeItem(at: self.cacheFile)
                        }
                        catch { }
                        
                        do {
                            try FileManager.default.moveItem(at: tempURL, to: self.cacheFile)
                        }
                        catch let error {
                            debugPrint(error)
                        }
                    }
                    catch
                    {// get from default
                        do {
                            do {
                                try FileManager.default.removeItem(at: tempURL)
                            }
                            catch{}
                            try self.getFrom(url: self.defaultFile)
                        }
                        catch let error
                        {// crashed
                            debugPrint(error)
                            return
                        }
                    }
                    completion?(self.tutorials!);
                }
                else if let error = error {
                    // get from default
                    debugPrint(error)
                    
                    do {
                        try self.getFrom(url: self.defaultFile)
                    }
                    catch let error
                    { // crashed
                        debugPrint(error)
                        return
                    }
                    completion?(self.tutorials!);
                }
                
            }
            task.resume()
        }
    }
    
    func getFromExisitng() throws
    {
        do {
            try getFrom(url: self.cacheFile)
        }
        catch {
            try getFrom(url: self.defaultFile)
        }
    }
    
    func getFrom(url: URL) throws
    {
        let data = try Data(contentsOf: url)
        self.tutorials = try JSONDecoder().decode([Tutorial].self, from: data)
    }
    
}
 */
