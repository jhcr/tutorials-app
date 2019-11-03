//
//  TutorialRepository.swift
//  Tutorials
//
//  Created by JING HE on 9/9/17.
//  Copyright © 2017 Urban Kangaroo Kit. All rights reserved.
//

import Foundation
public class TutorialRepository
{
    private var tutorials: [Tutorial]?;
    static let sharedInstance = TutorialRepository()
    
    init()
    {
        /*self.tutorials = [Tutorial(Id: "ecde600c-b32d-4c73-9792-495d1c568000",
                                   Title: "Candle DIY Tutorial",
                                   Images: ["candle-27","candle-6"],
                                   Feature: "with Soy Wax and Essntial Oil Blends",
                                   Summary: "Awaken your senses with our Soy Candle Making Kit- the clean alternative to traditional paraffin candles. Welcome guests into your home and conjure up images of freshly baked cookies or the French countryside with fully customizable oil blends for a more personalized experience.",
                                   Difficulty: Difficulty.Medium,
                                   TimeNeeded: "30-45min",
                                   Size: Size.SmallGroup,
                                   Yield: "6 jars",
                                   Included: [Item(Name: "Soy Wax Flake", Image: "soyWaxFlake"),
                                              Item(Name: "Sweet Orange Essential Oil", Image: "sweetOrangeEssentialOil"),
                                              Item(Name: "Lemon Sugar Fragrance Oil", Image: "lemonSugarFragranceOil"),
                                              Item(Name: "Vanilla + Lavender Essential Oil Blend", Image: "vanillaLavenderEssentialOilBlend"),
                                              Item(Name: "Glass Mason Jar", Image: "glassMasonJar"),
                                              Item(Name: "Wicks", Image: "wicks"),
                                              Item(Name: "Wick Stickums", Image: "wickStickum"),
                                              Item(Name: "Glass Candle Containers", Image: "glassCandleContainer"),
                                              Item(Name: "Golden Lids", Image: "goldenLids"),
                                              Item(Name: "Candle Labels", Image: "labels")],
                                   Demanded: [Item(Name:"Sauce Pan",Image:"saucePan"),
                                              Item(Name:"Scissor",Image:"scissor"),
                                              Item(Name:"Paper Towel",Image:"paperTowel")],
                                   Details: [Step(Text:"Gather your tools. You will need a SAUCE PAN, SCISSORS, and PAPER TOWEL.",
                                                  Images:["candle-3"]),
                                             Step(Text:"Working on a covered surface, pour one pack of the SOY WAX FLAKES into the GLASS MASON JAR.",
                                                  Images:["candle-6"]),
                                             Step(Text:"Add a few inches of water to the saucepan.",
                                                  Images:["candle-7"]),
                                             Step(Text:"Add the jar of wax. Let it simmer gently on low. Hot wax and simmering water are no joke, so PLEASE BE CAREFUL! When wax is hot enough to smoke, it’s in danger of igniting. NEVER LEAVE HEATING WAX UNATTENDED.",
                                                  Images:["candle-9"]),
                                             Step(Text:"Place a WICK STICKUM on the bottom of the WICK.",
                                                  Images:["candle-12"]),
                                             Step(Text:"Center the wick inside the glass candle jar.",
                                                  Images:["candle-13"]),
                                             Step(Text:"Repeat this step for the remaining jars.",
                                                  Images:["candle-14"]),
                                             Step(Text:"Keep watching as the wax melts. It happens quickly! ",
                                                  Images:["candle-15"]),
                                             Step(Text:"Once the wax is completely melted, turn off the heat. Using the DISH TOWEL to protect your hands, remove the jar of wax from the stove.",
                                                  Images:["candle-17"]),
                                             Step(Text:"Add the ESSENTIAL OIL or FRAGRANCE OIL to the melted wax.",
                                                  Images:["candle-18"]),
                                             Step(Text:"Stir carefully.",
                                                  Images:["candle-19"]),
                                             Step(Text:"Slowly pour the wax into the glass containers. Be careful! It's really hot.",
                                                  Images:["candle-21"]),
                                             Step(Text:"Let the wax dry. You can use a chopstick to prop up the wick as it dries.",
                                                  Images:["candle-22"]),
                                             Step(Text:"Once it's completely cool, snip the wick about 1/4\" away from the wax.",
                                                  Images:["candle-24"]),
                                             Step(Text:"Put Caps and LABELS on.",
                                                  Images:["candle-26"]),
                                             Step(Text:"Enjoy!",
                                                  Images:["candle-27"])]),
                          Tutorial(Id: "ecde600c-b32d-4c73-9792-495d1c568010",
                                   Title: "Bath Bomb DIY Tutorial",
                                   Images: ["bathbomb-45"],
                                   Feature: "with Kaolin Clay and Rose & Calendula Flowers and Essntial Oil Blends",
                                   Summary: "Discover the easy and effective way to make 15+ luxurious bath bombs in the comfort of your own home, and relax and unwind with peace of mind. Make Luxury Bath Bombs with Natural & Organic Ingredients: Each Kit comes with 10+ Natural Ingredients and Tools. Essential Oil Blend + 2 Sets of Bath Bomb Molds included.",
                                   Difficulty: Difficulty.Medium,
                                   TimeNeeded: "30-45min",
                                   Size: Size.SmallGroup,
                                   Yield: "18+ bombs",
                                   Included: [Item(Name: "Baking Soda", Image: "bakingSoda"),
                                              Item(Name: "Citric Acid", Image: "citricAcid"),
                                              Item(Name: "Corn Starch", Image: "cornStarch"),
                                              Item(Name: "Epsom Salt", Image: "epsomSalt"),
                                              Item(Name: "Kaolin Clay", Image: "kaolinClay"),
                                              Item(Name: "Rose Buds & Petals", Image: "rosePetals"),
                                              Item(Name: "Organic Calendula Flowers", Image: "calendulaFlowers"),
                                              Item(Name: "Olive Oil", Image: "oliveOil"),
                                              Item(Name: "Bergamot and Grapefruit Essential Oil Blend", Image: "bergamotGrapefruit"),
                                              Item(Name: "Sleep Time Essential Oil Blend", Image: "sleepTime"),
                                              Item(Name: "Eucalyptus & Spearmint Essential Oil Blend", Image: "eucalyptusSpearmint"),
                                              Item(Name: "Spray Bottle", Image: "sprayBottle"),
                                              Item(Name: "2 sets of Bath Bomb Mold", Image: "mold"),
                                              Item(Name: "Tissue Paper", Image: "tissuePaper"),
                                              Item(Name: "Labels", Image: "labels")],
                                   Demanded: [Item(Name:"Big bowl",Image:"bowl"),
                                              Item(Name:"Wire whisk",Image:"wireWhisk"),
                                              Item(Name:"Mixer",Image:"mixer")],
                                   Details: [Step(Text:"Prepare the tools you need: a big bowl, a wire whisk or a mixer.",
                                                  Images:["bathbomb-2"]),
                                             Step(Text:"Open the bag of baking soda, and add it into the bowl.",
                                                  Images:["bathbomb-5"]),
                                             Step(Text:"Open the bag of kaolin clay/corn starch, and add it into the bowl.",
                                                  Images:["bathbomb-6"]),
                                             Step(Text:"Add citric acid to the bowl.",
                                                  Images:["bathbomb-9"]),
                                             Step(Text:"PCombine the ingredients using a wire whisk or a mixer.",
                                                  Images:["bathbomb-11"]),
                                             Step(Text:"CDrizzle Moisturizing Oil Blend (either grape seed oil or apricot kennel oil) over the dry ingredients.",
                                                  Images:["bathbomb-13"]),
                                             Step(Text:"Drizzle Essential Oil Blend over the ingredients.",
                                                  Images:["bathbomb-18"]),
                                             Step(Text:"Use the whisk or mixer to combine all the ingredients again and make sure they are well incorporated.",
                                                  Images:["bathbomb-15"]),
                                             Step(Text:"Be sure to break up any clumps of powder that are in the mixture.",
                                                  Images:["bathbomb-20"]),
                                             Step(Text:"If the mixture is too dry and crumbly, fill the spray bottle with rubbing alcohol or water, and spritz until mixture sticks together. Half bottle of water is good in the climate of California",
                                                  Images:["bathbomb-23"]),
                                             Step(Text:"Once the mixture has been thoroughly blended, take some of the mixture and squeeze in the palm of your hand. If the mixture sticks together like wet sand, it is ready to be molded.",
                                                  Images:["bathbomb-24","bathbomb-25"]),
                                             Step(Text:"Pack both halves of a mold with enough mixture,  so the tops are mounded over.",
                                                  Images:["bathbomb-28"]),
                                             Step(Text:"With one half in each hand, tightly push the mold together.",
                                                  Images:["bathbomb-29"]),
                                             Step(Text:"Remove excessive powder around the edge to get a smooth finish.",
                                                  Images:["bathbomb-30"]),
                                             Step(Text:"Wait for several minutes before open the mold.",
                                                  Images:["bathbomb-31"]),
                                             Step(Text:"After one side is open, gently tap the other side from top to release the ball from mold.",
                                                  Images:["bathbomb-44","bathbomb-39"]),
                                             Step(Text:"If you like, you may add flower petals in the mold before pack with the mixture.",
                                                  Images:["bathbomb-41","bathbomb-42","bathbomb-43"]),
                                             Step(Text:"Continue until all bath bombs are made. Let the bath bombs harden and dry for 24 - 48 hours before wrapping.",
                                                  Images:["bathbomb-45"]),
                                             Step(Text:"When ready to package, wrap all bath bombs with tissue papers and apply labels on.",
                                                  Images:["bathbomb-46","bathbomb-47","bathbomb-48","bathbomb-49"]),
                                             Step(Text:"Enjoy!",
                                                  Images:["bathbomb-50"])]),
                          Tutorial(Id: "ecde600c-b32d-4c73-9792-495d1c568020",
                                   Title: "Lip Balm DIY Tutorial",
                                   Images: ["lipbalm-31"],
                                   Feature: "with Cocoa Butter and Beeswax and Essential Oil",
                                   Summary: "Discover the fun way to pamper the glamourous, lip-balm loving ladies in your family! This well-curated kit contains everything you need to make luxurious, all natural lip balms right from the comfort of your own home.",
                                   Difficulty: Difficulty.Medium,
                                   TimeNeeded: "30-60min",
                                   Size: Size.SmallGroup,
                                   Yield: "12 or 36 tubes",
                                   Included: [Item(Name: "Grapeseed Oil", Image: "grapeseedOil"),
                                              Item(Name: "Beeswax", Image: "beeswax"),
                                              Item(Name: "Cocoa Butter", Image: "cocoaButter"),
                                              Item(Name: "Stevia  (12-tube version)", Image: "stevia"),
                                              Item(Name: "Peppermint Essential Oil", Image: "peppermint"),
                                              Item(Name: "Summer Peach Flavor Oil (36-tube version)", Image: "peach"),
                                              Item(Name: "Bubble Gum Flavor Oil (36-tube version)", Image: "bubbleGum"),
                                              Item(Name: "Organic Matcha Powder (36-tube version)", Image: "matchaPowder"),
                                              Item(Name: "Colloidal Oatmeal (36-tube version)", Image: "colloidalOatmeal"),
                                              Item(Name: "Beet Powder (36-tube version)", Image: "beetPowder"),
                                              Item(Name: "Droppers", Image:"dropper"),
                                              Item(Name: "Stirring Sticks", Image: "stirringStick"),
                                              Item(Name: "Lip Balm Tubes", Image: "lipBalmTube"),
                                              Item(Name: "Lip Balm Labels", Image: "labels")],
                                   Demanded: [Item(Name:"Glass Cup",Image:"glassCup"),
                                              Item(Name:"Pot",Image:"saucePan")],
                                   Details: [Step(Text:"Prepare the tools you need: a glass cup, a pot.",
                                                  Images:["lipbalm-1"]),
                                             Step(Text:"Heat 4- 6 cups of water in the pot.",
                                                  Images:["lipbalm-2"]),
                                             Step(Text:"Carefully transfer the pre-measured Beeswax pellets to the glass cup, and place the cup in the hot water.",
                                                  Images:["lipbalm-6"]),
                                             Step(Text:"Heat on low.",
                                                  Images:["lipbalm-3","lipbalm-11"]),
                                             Step(Text:"Once the beeswax has completely melted, add Cocoa Butter and Grapeseed Oil to the cup.",
                                                  Images:["lipbalm-13","lipbalm-15"]),
                                             Step(Text:"If you would like to add more color at this point, you may add a small dab of your favorite lipstick and melt it into the other ingredients.",
                                                  Images:["lipbalm-18","lipbalm-20"]),
                                             Step(Text:"Add the Peppermint Essential Oil in.",
                                                  Images:["lipbalm-23"]),
                                             Step(Text:"Add a tiny bit of the all natural Stevia in.",
                                                  Images:["lipbalm-26"]),
                                             Step(Text:"Stir the mixture thoroughly.",
                                                  Images:["lipbalm-17"]),
                                             Step(Text:"Turn off the heat and pick up the cup with a dish towel CAREFULLY.",
                                                  Images:["lipbalm-21"]),
                                             Step(Text:"Use the dropper to transfer the mixture into the tubes.",
                                                  Images:["lipbalm-29"]),
                                             Step(Text:"Allow the lip balms to cool completely. Put caps and labels on.",
                                                  Images:["lipbalm-31"])]),
                          Tutorial(Id: "ecde600c-b32d-4c73-9792-495d1c568030",
                                   Title: "Hot Sauce DIY Tutorial",
                                   Images: ["hotsauce-22"],
                                   Feature: "with Four Types of Peppers, Dried Fruits and Can sugar",
                                   Summary: "Crank up the AC, it’s about to get hot in here! Our FULLY CUSTOMIZABLE hot sauce making kit is re-inventing the way you cook. This one-of-a-kind kit includes everything you need to make six mouth-watering bottles of hot sauce so you can amp up the flavor right in your own kitchen.",
                                   Difficulty: Difficulty.Medium,
                                   TimeNeeded: "45-60min",
                                   Size: Size.SmallGroup,
                                   Yield: "6 bottles",
                                   Included: [Item(Name: "Chipotle Pepper", Image: "chipotlePeper"),
                                               Item(Name: "De Arbol Pepper", Image: "deArbolPeper"),
                                               Item(Name: "Ghost Pepper", Image: "ghostPeper"),
                                               Item(Name: "Guajillo Pepper", Image: "guajilloPepper"),
                                               Item(Name: "Dried Mango", Image: "mango"),
                                               Item(Name: "Dried Papaya", Image: "papaya"),
                                              Item(Name: "New Mexico Chili Powder", Image: "newMexicoChiliPowder"),
                                              Item(Name: "Ancho Chili Powder", Image: "anchoChiliPowder"),
                                              Item(Name: "Cayenne Chili Powder", Image: "cayenneChiliPowder"),
                                              Item(Name: "Madras Curry Powder", Image: "madrasCurryPowder"),
                                              Item(Name: "Garlic Powder", Image: "garlicPowder"),

                                              Item(Name: "Onion Powder", Image: "onionPowder"),
                                              Item(Name: "Turbinado Cane Sugar Pack", Image: "caneSugar"),
                                              Item(Name: "Apple Cider Vinegar", Image: "appleCiderVinegar"),
                                              Item(Name: "Glass Sauce Bottle + Cap", Image: "glassSauceBottle"),
                                              Item(Name: "Bottle Stopper", Image: "stopper"),
                                              Item(Name: "Glove", Image: "glove"),
                                              Item(Name: "Labels", Image: "labels")],
                                   Demanded: [Item(Name:"Large bowl",Image:"bowl"),
                                              Item(Name:"Blender",Image:"blender"),
                                              Item(Name:"Knife",Image:"knife"),
                                              Item(Name:"Cutting Board",Image:"cuttingBoard"),
                                              Item(Name:"Salt",Image:"salt")],
                                   Details: [Step(Text:"Gather your tools and ingredients: You will need a large bowl, a blender, a knife, a cutting board and salt.",
                                                  Images:["hotsauce-3"]),
                                             Step(Text:"Put the glove on, prepare to touch the peppers.",
                                                  Images:["hotsauce-4"]),
                                             Step(Text:"Open the brown bag and find the pack of dried peppers inside. You can make 3 types of hot sauce by the kit. Ingredients used for different flavors are already packaged into 3 different brown bags, you will use only one brown bag at a time.",
                                                  Images:["hotsauce-5"]),
                                             Step(Text:"Cut off the tops of the dried peppers, and then coarsely chop them up.",
                                                  Images:["hotsauce-6","hotsauce-7"]),
                                             Step(Text:"Place the chopped peppers in a small bowl.",
                                                  Images:["hotsauce-8"]),
                                             Step(Text:"Pour 12 oz. of boiling water (1 - 1/2 cups) over the peppers, and let them soak in the water for about 25 - 30 minutes.",
                                                  Images:["hotsauce-9"]),
                                             Step(Text:"Add in 1/4 cup of apple cider vinegar into the bowl. You may add up to 1/3 cup if you prefer a more vinegar flavor in your hot sauce.",
                                                  Images:["hotsauce-11"]),
                                             Step(Text:"Add all packs of spicy powder (in the same brown bag with the peppers) into the bowl.",
                                                  Images:["hotsauce-12","hotsauce-13","hotsauce-14"]),
                                             Step(Text:"Add 2 - 3 packs of sugar (depending on desired sweetness) into the bowl.",
                                                  Images:["hotsauce-15"]),
                                             Step(Text:"AAdd 1/4 tbsp of salt into the bowl.",
                                                  Images:["hotsauce-16"]),
                                             Step(Text:"Pour the mixture into a blender or food processor. Blend until smooth.",
                                                  Images:["hotsauce-17"]),
                                             Step(Text:"Cut one inch of the funnel by 45 degree for easier pouring.",
                                                  Images:["hotsauce-18"]),
                                             Step(Text:"Let the wax dry. You can use a chopstick to prop up the wick as it dries.",
                                                  Images:["hotsauce-19"]),
                                             Step(Text:"Put on the stoppers and caps.",
                                                  Images:["hotsauce-20"]),
                                             Step(Text:"Put the hot sauce labels on the bottle.",
                                                  Images:["hotsauce-21"]),
                                             Step(Text:"Enjoy! Move on to next flavor of your choice and made by same steps.",
                                                  Images:["hotsauce-22"])]),
                          Tutorial(Id: "ecde600c-b32d-4c73-9792-495d1c568040",
                                   Title: "Soap DIY Tutorial",
                                   Images: ["candle-27"],
                                   Feature: "with Goat Milk Soap Base and Himalayan Salt",
                                   Summary: "Awaken your senses with our Soy Candle Making Kit- the clean alternative to traditional paraffin candles. Welcome guests into your home and conjure up images of freshly baked cookies or the French countryside with fully customizable oil blends for a more personalized experience.",
                                   Difficulty: Difficulty.Medium,
                                   TimeNeeded: "30min",
                                   Size: Size.SmallGroup,
                                   Yield: "6 bars", 
                                   Included: [Item(Name: "Pre-Cut Goat Milk Soap Base", Image: "soapBase"),
                                              Item(Name: "Himalayan Salt", Image: "himalayanSalt"),
                                              Item(Name: "Goat Milk & Honey Fragrance Oil", Image: "goatMilkHoney"),
                                              Item(Name: "Lemon Sugar Fragrance Oil", Image: "lemonSugarFragranceOil"),
                                              Item(Name: "Silicone Mold", Image: "soapMold"),
                                              Item(Name: "Clear cello bags", Image: "bags"),
                                              Item(Name: "Labels", Image: "labels")],
                                   Demanded: [Item(Name:"Microwave Safe Container",Image:"glassMasonJar"),
                                              Item(Name:"Microwave",Image:"microwave")],
                                   Details: [Step(Text:"Place one bag of the pre-cut Soap Cubes in a large microwave safe container and heat the soap in microwave for 60-90 seconds. If soap cubes are not completely melted, microwave for additional 15 seconds or until completely melted.",
                                                  Images:[]),
                                             Step(Text:"Remove soap from microwave CAREFULLY and add the fragrance oil (of your choice).",
                                                  Images:[]),
                                             Step(Text:"Add one bag of Himalayan salt to soap and stir until blended.",
                                                  Images:[]),
                                             Step(Text:"Place silicone mold on a cookie sheet to give it stability when moving. Carefully pour the soap into 3 cavities being sure to stir the soap mixture before each pour. This will keep the salts well-blended so each bar with have salts in them.",
                                                  Images:[]),
                                             Step(Text:"Repeat above steps to make second set of soaps (with different fragrance).",
                                                  Images:[]),
                                             Step(Text:"When soap returns to room temperature, carefully un-mold the soap and package them in the clear cello bags.",
                                                  Images:[]),
                                             Step(Text:"Apply labels. Enjoy :)",
                                                  Images:[])]),
                          Tutorial(Id: "ecde600c-b32d-4c73-9792-495d1c568050",
                                   Title: "Body Lotion DIY Tutorial",
                                   Images: ["lotion-17"],
                                   Feature: "with Grape Seed Oil and Shea Butter and Colloidal Oatmeal",
                                   Summary: "Invigorate your senses with our all-natural, DIY moisturizing body lotion kit designed to provide your skin with long-lasting, silky-smooth hydration. This kit provides everything you need to make up to four bottles of luxurious lotion that can be enjoyed time and time again.",
                                   Difficulty: Difficulty.Medium,
                                   TimeNeeded: "30min",
                                   Size: Size.SmallGroup,
                                   Yield: "4 bottles",
                                   Included: [Item(Name: "Grapeseed Oil", Image: "grapeseedOil"),
                                              Item(Name: "Vegetable Glycerin", Image: "glycerin"),
                                              Item(Name: "Shea Butter", Image: "sheaButter"),
                                              Item(Name: "Emulsifying Wax", Image: "emulsifyingWax"),
                                              Item(Name: "Stearic Acid", Image: "stearicAcid"),
                                              Item(Name: "Colloidal Oatmeal", Image: "colloidalOatmeal"),
                                              Item(Name: "Paraben Free Preservative", Image: "preservative"),
                                              Item(Name: "Lemon Sugar Fragrance Oil", Image: "lemonSugarFragranceOil"),
                                              Item(Name: "Goat Milk & Honey Fragrance Oil", Image: "goatMilkHoney"),
                                              Item(Name: "Amber Tolles + Pumps", Image: "TolleAndPump"),
                                              Item(Name: "Labels", Image: "labels")],
                                   Demanded: [Item(Name:"Big Bowl",Image:"bowl"),
                                              Item(Name: "WireWhisk",Image:"wireWhisk")],
                                   Details: [Step(Text:"Prepare the tools you need: a big bowl, a wire whisk or a mixer.",
                                                  Images:["lotion-1"]),
                                             Step(Text:"In a large glass mixing bowl, add 24 ounces of water.",
                                                  Images:["lotion-3"]),
                                             Step(Text:"Add STEARIC ACID and EMULSIFYING WAX to the water.",
                                                  Images:["lotion-4"]),
                                             Step(Text:"Place bowl in microwave and heat until stearic acid and Emulsifying wax are completely melted. This could take between 2-3 MINUTES or longer depending on wattage of your microwave. Waxes must be completely melted for lotion to emulsify properly.",
                                                  Images:[]),
                                             Step(Text:"Stir all ingredients once wax mixture has melted in.",
                                                  Images:[]),
                                             Step(Text:"To the water mixture, add in SHEA BUTTER, GLYCERIN, and GRAPESEED OIL. Gently stir to allow butter to soften and melt.",
                                                  Images:["lotion-6","lotion-7","lotion-8"]),
                                             Step(Text:"Using a stick blender or hand mixer, begin to blend ingredients CAREFULLY. Continue blending until mixture starts to thicken. This may take SEVERAL MINUTES.",
                                                  Images:["lotion-5"]),
                                             Step(Text:"Once the mixture starts to thicken, turn off blender and let the mixture sit and cool for 30 MINUTES.",
                                                  Images:[]),
                                             Step(Text:"Add PRESERVATIVE, FRAGRANCE OIL of your choice and COLLOIDAL OATMEAL to the mixture, blend thoroughly for about 2-3 MINUTES until all ingredients are thoroughly incorporated.",
                                                  Images:["lotion-7","lotion-9","lotion-11","lotion-5"]),
                                             Step(Text:"Pour the mixture into bottles & Let lotion cool completely.",
                                                  Images:["lotion-12"]),
                                             Step(Text:"Trim the dip tubes on the pumps to fit the bottles and insert into the bottles.",
                                                  Images:["lotion-13","lotion-14"]),
                                             Step(Text:"Put labels on. Enjoy :)",
                                                  Images:["lotion-16","lotion-17"])
                                             ])];
        saveToJsonFile();
        */
    }
    
    public func GetTutorialListAsync(completion: (([Tutorial]?) -> Void)?)
    {
        guard let t = self.tutorials else {
            let urlString = URL(string: "https://cdn.shopify.com/s/files/1/1461/9402/files/tutorials.json?")
            HTTP.get(request: URLRequest(url: urlString!)) { (result: Result<[Tutorial]>) in
                switch result {
                    case Result.success(let data):
                        self.tutorials = data
                        completion?(self.tutorials)
                    case Result.failure(let error):
                        debugPrint(error)
                }
               
            }
            return
        }
        completion?(t)
    }
    
    public func GetTutorialAsync(Id: String, completion:((Tutorial?) -> Void)?)
    {
        GetTutorialListAsync(){ (tutorialList) in
            completion?( tutorialList?.first(where: {$0.Id == Id}))
        }
    }

    func SaveToJsonFile() {
        // Get the url of Persons.json in document directory
        guard let documentDirectoryUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let fileUrl = documentDirectoryUrl.appendingPathComponent("tutorials.json")
        
        
        // Transform array into data and save it into filex
        do {
            let encoder = JSONEncoder();
            encoder.outputFormatting = .prettyPrinted;
            let data = try encoder.encode(self.tutorials);
            try data.write(to: fileUrl, options: [])
        } catch {
            print(error)
        }
    }

   /* public func GetTutorialList(completion:(() -> Void)?) -> Array<Tutorial>?
    {
        guard let t = self.tutorials else {
            FetchData_Tutorials(completion: completion)
            return nil;
        }
        return t;
    }*/
    
    

}
