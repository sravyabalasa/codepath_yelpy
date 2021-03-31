//
//  RestaurantsCell.swift
//  Yelpy
//
//  Created by Sravya Balasa on 3/31/21.
//  Copyright © 2021 memo. All rights reserved.
//

import UIKit

class RestaurantsCell: UITableViewCell {
    @IBOutlet var restaurantImage: UIImageView!
    @IBOutlet var ratingView: UIImageView!
    @IBOutlet var label: UILabel!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var cuisineLabel: UILabel!
    @IBOutlet var numberLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
