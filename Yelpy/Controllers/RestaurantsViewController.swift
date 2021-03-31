//
//  ViewController.swift
//  Yelpy
//
//  Created by Memo on 5/21/20.
//  Copyright © 2020 memo. All rights reserved.
//

import UIKit
import AlamofireImage

class RestaurantsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView: UITableView!
    
    var restaurantsArray: [[String: Any?]] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        getData()
    }
    
    func getData () {
        API.getRestaurants { (restaurants) in
            guard let restaurants = restaurants else {
                return
            }
            self.restaurantsArray = restaurants
            self.tableView.reloadData()
        }
    }
    
    func restaurantRating (rating:NSNumber) -> String {
        switch rating {
        case 1:
            return "1"
        case 1.5:
            return "1_half"
        case 2:
            return "2"
        case 2.5:
            return "2_half"
        case 3:
            return "3"
        case 3.5:
            return "3_half"
        case 4:
            return "4"
        case 4.5:
            return "4_half"
        case 5:
            return "5"
        default:
            return ""
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        restaurantsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantsCell", for: indexPath) as! RestaurantsCell
        let restaurant = restaurantsArray[indexPath.row]

        cell.label.text = restaurant["name"] as? String ?? ""
        cell.numberLabel.text = restaurant["display_phone"] as? String
        cell.ratingLabel.text = (restaurant["review_count"] as? NSNumber)?.stringValue
        
        let categories = restaurant["categories"] as? [[String: Any?]]
        let categoriesTitle = categories?.map({ (category) -> String in
            return (category["title"] as? String ?? "")
        })
        cell.cuisineLabel.text = categoriesTitle?.joined(separator: ", ")

        cell.ratingView.image = UIImage(named: "regular_" + restaurantRating(rating: restaurant["rating"] as! NSNumber))
        
        if let imageUrlString = restaurant["image_url"] as? String {
            let imageUrl = URL(string:imageUrlString)
            cell.restaurantImage.af.setImage(withURL: imageUrl!)
        }

        return cell
    }
}
