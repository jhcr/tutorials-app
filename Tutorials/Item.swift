//
//  Item.swift
//  Tutorials
//
//  Created by JING HE on 9/8/17.
//  Copyright © 2017 Urban Kangaroo Kit. All rights reserved.
//

import Foundation
struct Item: Codable{
    var Name:String
    var Image:String
    
    enum CodingKeys: String, CodingKey
    {
        case Name = "name"
        case Image = "image"
    }
}
