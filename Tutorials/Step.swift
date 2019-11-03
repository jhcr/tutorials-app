//
//  Step.swift
//  Tutorials
//
//  Created by JING HE on 9/8/17.
//  Copyright © 2017 Urban Kangaroo Kit. All rights reserved.
//

import Foundation
struct Step: Codable{
    var Text: String
    var Images: Array<String>?
    
    enum CodingKeys: String, CodingKey
    {
        case Text = "text"
        case Images = "images"
    }
}
