//
//  Meal.swift
//  FoodManagement2024
//
//  Created by DaiTran on 4/5/24.
//

import UIKit
class Meal {
    //MARK: Properties
    var name:String
    var image:UIImage?
    var rating:Int
    
    //MARK: Constructor
    init?(name: String, image: UIImage? = nil, rating: Int) {
        if name.isEmpty  {
            return nil
        }
        if rating < 0 || rating > 5{
            return nil
        }
        self.name = name
        self.image = image
        self.rating = rating
    }
    
    
    
}
