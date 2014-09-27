//
//  BusinessResultCell.swift
//  Yelp
//
//  Created by Jonathan Tsai on 9/23/14.
//  Copyright (c) 2014 Hacktoolkit. All rights reserved.
//

import UIKit

class BusinessResultCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var ratingImageView: UIImageView!
    @IBOutlet weak var reviewCountLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!

    var resultNum: Int!

    var business: YelpBusinessResult! {
        willSet(newBusiness) {
            self.nameLabel.text = "\(resultNum). \(newBusiness.name)"

            // rounded corners for thumbnail image
            self.thumbnailImageView.layer.cornerRadius = 5
            self.thumbnailImageView.clipsToBounds = true

            ImageUtils.sharedInstance.displayImageUrl(newBusiness.imageUrl, imageView: self.thumbnailImageView)
            ImageUtils.sharedInstance.displayImageUrl(newBusiness.ratingImageUrl, imageView: self.ratingImageView)

            self.reviewCountLabel.text = "\(newBusiness.reviewCount) Review" + (newBusiness.reviewCount == 1 ? "" : "s")
            self.categoryLabel.text = newBusiness.getCategoriesAsString()
        }
        
        didSet(oldValue) {
//            println(business.name)
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
