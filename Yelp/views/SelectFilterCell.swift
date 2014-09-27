//
//  SelectFilterCell.swift
//  Yelp
//
//  Created by Jonathan Tsai on 9/26/14.
//  Copyright (c) 2014 Hacktoolkit. All rights reserved.
//

import UIKit

class SelectFilterCell: FilterCell {

    @IBOutlet weak var filterLabel: UILabel!

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
        // Drawing code
    }
    */

    override func render() {
        var isSectionExpanded = self.sectionExpanded ?? false
        if isSectionExpanded {
            self.filterLabel.text = self.filterSection.options[self.rowNum]
        } else {
            self.filterLabel.text = self.filterSection.getSelectedOption()
        }
    }
}
