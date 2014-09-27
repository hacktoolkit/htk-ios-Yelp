//
//  SwitchFilterCell.swift
//  Yelp
//
//  Created by Jonathan Tsai on 9/26/14.
//  Copyright (c) 2014 Hacktoolkit. All rights reserved.
//

import UIKit

class SwitchFilterCell: FilterCell {

    @IBOutlet weak var filterLabel: UILabel!
    @IBOutlet weak var filterSwitch: UISwitch!

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
        // Drawing code
    }
    */

    override func render() {
        var options = self.filterSection.options
        self.filterLabel.text = options[self.rowNum]
    }

    @IBAction func onFilterSwitchFlipped(sender: AnyObject) {
        var newState = self.filterSection.toggleOption(self.rowNum)
        if sender is UISwitch {
            var flippedSwitch = sender as UISwitch
        } else {
            // TODO: there is a bug here. the state is being toggled but the ui is not redrawing
            self.filterSwitch!.setOn(newState, animated: true)
        }
    }
}
