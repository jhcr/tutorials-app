//
//  HTTP.swift
//  Tutorials
//
//  Created by JING HE on 10/4/17.
//  Copyright © 2017 Urban Kangaroo Kit. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T?)
    case failure(Error)
}

enum HTTPError: Error {
    case noResponse
    case unsuccesfulStatusCode(Int)
}

typealias HTTPCompletion<T> = ((Result<T>) -> Void)

struct HTTP {
    private static var successCodes: Range<Int> = 200..<299
    
    static func get<T: Codable>(request: URLRequest, completion: @escaping HTTPCompletion<T>){
        
        let session = URLSession.shared
        var task: URLSessionDataTask?
        
        debugPrint(request)
        task = session.dataTask(with: request) { (data: Data?, response:URLResponse?, error:Error?) in
            
            guard let error = error else {
                //self.evaluate(data: data, response: response, completion: completion)
                guard let httpResponse = response as? HTTPURLResponse else {
                    completion(.failure(HTTPError.noResponse))
                    return
                }
                
                guard successCodes.contains(httpResponse.statusCode) else {
                    completion(.failure(HTTPError.unsuccesfulStatusCode(httpResponse.statusCode)))
                    return
                }
  
                guard let data = data else {
                    completion(.success(nil))
                    return
                }
                
                let json: T? = dataToJSON(data: data)
                completion(.success(json))
                return
            }
            
            completion(.failure(error))
        }
        task?.resume()
    }
   
    fileprivate static func dataToJSON<T:Codable>(data: Data) -> T? {
        do {
            //return try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? T
            return try JSONDecoder().decode(T.self, from: data)
        } catch let jsonError {
            debugPrint(jsonError)
        }
        return nil
    }
}

