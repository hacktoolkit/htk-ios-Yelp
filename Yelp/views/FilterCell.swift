//
//  FilterCell.swift
//  Yelp
//
//  Created by Jonathan Tsai on 9/26/14.
//  Copyright (c) 2014 Hacktoolkit. All rights reserved.
//

import UIKit

class FilterCell: UITableViewCell {

    var filterSection: FilterSection!
    var rowNum: Int!
    var sectionExpanded: Bool!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func render() {
        
    }
}
