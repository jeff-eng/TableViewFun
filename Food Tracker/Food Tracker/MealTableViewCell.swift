//
//  MealTableViewCell.swift
//  Food Tracker
//
//  Created by Jeffrey Eng on 11/18/16.
//  Copyright © 2016 Jeffrey Eng. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {

    // MARK: Properties
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
