//
//  FilterCell.swift
//  Yelp
//
//  Created by Jonathan Tsai on 9/24/14.
//  Copyright (c) 2014 Hacktoolkit. All rights reserved.
//

import UIKit

class FilterCell: UITableViewCell {

    @IBOutlet weak var someLabel: UILabel!

    var name: String! {
        willSet(newValue) {
            someLabel.text = newValue
        }

        didSet(oldValue) {
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
