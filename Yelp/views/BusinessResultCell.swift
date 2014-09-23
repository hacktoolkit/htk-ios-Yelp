//
//  BusinessResultCell.swift
//  Yelp
//
//  Created by Jonathan Tsai on 9/23/14.
//  Copyright (c) 2014 Hacktoolkit. All rights reserved.
//

import UIKit

class BusinessResultCell: UITableViewCell {

    var business: YelpBusinessResult! {
        willSet(newBusiness) {
            self.nameLabel.text = newBusiness.name
            ImageUtils.sharedInstance.displayImageUrl(newBusiness.imageUrl, imageView: self.thumbnailImage)
        }

        didSet(oldValue) {
//            println(business.name)
        }
    }

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var thumbnailImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
