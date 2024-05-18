//
//  MealCell.swift
//  FoodManagement2024
//
//  Created by DaiTran on 4/5/24.
//

import UIKit

class MealCell: UITableViewCell {

    @IBOutlet var mealName: UILabel!
    @IBOutlet var mealRating: UIRating!
    @IBOutlet var mealImage: UIImageView!
    
    var onTap: UITapGestureRecognizer?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
