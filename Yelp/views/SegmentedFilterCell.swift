//
//  SegmentedFilterCell.swift
//  Yelp
//
//  Created by Jonathan Tsai on 9/26/14.
//  Copyright (c) 2014 Hacktoolkit. All rights reserved.
//

import UIKit

class SegmentedFilterCell: FilterCell {

    @IBOutlet weak var segmentedControl: UISegmentedControl!

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
        // Drawing code
    }
    */

    override func render() {
        if self.segmentedControl.numberOfSegments != self.filterSection.options.count {
            self.segmentedControl.removeAllSegments()
            for var i=0; i < self.filterSection.options.count; ++i {
                var option = self.filterSection.options[i]
                self.segmentedControl.insertSegmentWithTitle(option, atIndex: i, animated: false)
            }
        }
    }
}
