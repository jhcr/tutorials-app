//
//  Connectivity.swift
//  Tutorials
//
//  Created by JING HE on 10/9/17.
//  Copyright © 2017 Urban Kangaroo Kit. All rights reserved.
//

import Foundation
import SystemConfiguration

struct Network {
    static var reachability: Connectivity?
}
class Connectivity {
    
    private let reachability:SCNetworkReachability? //= SCNetworkReachabilityCreateWithName(nil, "www.google.com")
    
    // Queue where the `SCNetworkReachability` callbacks run
    private let queue =  DispatchQueue(label: "ReachabilityQueue") //DispatchQueue(label: "ReachabilityQueue")
    
    // We use it to keep a backup of the last flags read.
    private var currentReachabilityFlags: SCNetworkReachabilityFlags?
    
    // Flag used to avoid starting listening if we are already listening
    private var isListening = false
    
    init(_ hostname: String?)
    {
        if hostname != nil {
            reachability = SCNetworkReachabilityCreateWithName(nil, hostname!)
        }
        else {
            reachability = SCNetworkReachabilityCreateWithName(nil, "www.google.com")
        }
    }
    // Starts listening
    func start() {
        // Checks if we are already listening
        guard !isListening else { return }
        
        // Optional binding since `SCNetworkReachabilityCreateWithName` returns an optional object
        guard let reachability = reachability else { return }
        
        // Creates a context
        var context = SCNetworkReachabilityContext(version: 0, info: nil, retain: nil, release: nil, copyDescription: nil)
        // Sets `self` as listener object
        context.info = UnsafeMutableRawPointer(Unmanaged<Connectivity>.passUnretained(self).toOpaque())
        
        let callbackClosure: SCNetworkReachabilityCallBack? = {
            (reachability:SCNetworkReachability, flags: SCNetworkReachabilityFlags, info: UnsafeMutableRawPointer?) in
            guard let info = info else { return }
            
            // Gets the `Handler` object from the context info
            let handler = Unmanaged<Connectivity>.fromOpaque(info).takeUnretainedValue()
            
            DispatchQueue.global().async {
                handler.checkReachability(flags: flags)
            }
        }
        
        // Registers the callback. `callbackClosure` is the closure where we manage the callback implementation
        if !SCNetworkReachabilitySetCallback(reachability, callbackClosure, &context) {
            // Not able to set the callback
        }
        
        // Sets the dispatch queue which is `DispatchQueue.main` for this example. It can be also a background queue
        if !SCNetworkReachabilitySetDispatchQueue(reachability, queue) {
            // Not able to set the queue
        }
        
        // Runs the first time to set the current flags
        queue.async {
            // Resets the flags stored, in this way `checkReachability` will set the new ones
            self.currentReachabilityFlags = nil
            
            // Reads the new flags
            self.readNewFlags()
        }
        
        isListening = true
    }
    
    private func readNewFlags(){
        var flags = SCNetworkReachabilityFlags()
        SCNetworkReachabilityGetFlags(reachability!, &flags)
    
        self.checkReachability(flags: flags)
    }
    
    var isReachable: Bool{
        if(currentReachabilityFlags == nil) {
            self.readNewFlags()
        }
        return currentReachabilityFlags!.contains(.reachable) == true
    }
    
    // Called inside `callbackClosure`
    private func checkReachability(flags: SCNetworkReachabilityFlags) {
        if currentReachabilityFlags != flags {
            // 🚨 Network state is changed 🚨
            
            // Stores the new flags
            currentReachabilityFlags = flags
        }
    }
    
    // Stops listening
    func stop() {
        // Skips if we are not listening
        // Optional binding since `SCNetworkReachabilityCreateWithName` returns an optional object
        guard isListening,
            let reachability = reachability
            else { return }
        
        // Remove callback and dispatch queue
        SCNetworkReachabilitySetCallback(reachability, nil, nil)
        SCNetworkReachabilitySetDispatchQueue(reachability, nil)
        
        isListening = false
    }
}
