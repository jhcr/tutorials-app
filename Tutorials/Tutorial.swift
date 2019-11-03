//
//  Toturial.swift
//  Tutorials
//
//  Created by JING HE on 9/6/17.
//  Copyright © 2017 Urban Kangaroo Kit. All rights reserved.
//

import Foundation

public struct Tutorial: Codable
{
    let Id: String
    let Title: String
    let Images: [String]
    let Feature: String?
    let Summary: String?
    let Difficulty: Difficulty?
    let TimeNeeded: String?
    let Size: Size?
    let Yield: String?
    let Included: [Item]?
    let Demanded: [Item]?
    let Details: [Step]?
    
    enum CodingKeys: String, CodingKey
    {
        case Id = "id"
        case Title = "title"
        case Images = "images"
        case Feature = "feature"
        case Summary = "summary"
        case Difficulty = "difficulty"
        case TimeNeeded = "timeNeeded"
        case Size = "size"
        case Yield = "yield"
        case Included = "included"
        case Demanded = "demanded"
        case Details = "details"
    }
    
    
    /*
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self);
        Id = try container.decode(String.self, forKey: .Id);
        Title = try container.decode(String.self, forKey: .Title);
        Summary = try container.decode(String.self, forKey: .Summary);
        Difficulty = try container.decode(Difficulty.self, forKey: .Difficulty);
        TimeNeeded = try container.decode(String.self, forKey: .TimeNeeded);
        Size = try container.decode(Size.self, forKey: .Size);
        Yield = try container.decode(String.self, forKey: .Yield);
        
        var imagesContainer = try container.nestedUnkeyedContainer(forKey:.Images);
        Images = Array<String>();
        while (!imagesContainer.isAtEnd)
        {
            Images.append(try imagesContainer.decode(String.self));
        }
        
        var includedContainer = try container.nestedUnkeyedContainer(forKey:.Included);
        Included = Array<Item>();
        while (!includedContainer.isAtEnd)
        {
            var itemContainer = try includedContainer.nestedContainer(keyedBy: ItemCodingKeys.self);
            let name = try itemContainer.decode(String.self, forKey: .Name);
            let image = try itemContainer.decode(String.self, forKey: .Image);
            var item = Item(Name: name, Image: image);
            Included!.append(item);
        }
        
        var demandedContainer = try container.nestedUnkeyedContainer(forKey:.Demanded);
        Demanded = Array<Item>();
        while (!demandedContainer.isAtEnd)
        {
            var itemContainer = try demandedContainer.nestedContainer(keyedBy: ItemCodingKeys.self);
            let name = try itemContainer.decode(String.self, forKey: .Name);
            let image = try itemContainer.decode(String.self, forKey: .Image);
            var item = Item(Name: name, Image: image);
            Demanded!.append(item);
        }
        
        var detailsContainer = try container.nestedUnkeyedContainer(forKey:.Details);
        Details = Array<Step>();
        while (!detailsContainer.isAtEnd)
        {
            var stepContainer = try detailsContainer.nestedContainer(keyedBy: StepCodingKeys.self);
            let text = try stepContainer.decode(String.self, forKey: .Text);
            var imagesContainer = try stepContainer.nestedUnkeyedContainer(forKey: .Images);
            
            var images = Array<String>();
            while (!imagesContainer.isAtEnd)
            {
                images.append(try imagesContainer.decode(String.self));
            }
            var step = Step(Text: text, Images: images);
            Details!.append(step);
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy:
            CodingKeys.self);
        try container.encode(Name, forKey: .Name);
        try container.encode(Image, forKey: .Image)
    }
 */
}
