//
//  FiltersViewController.swift
//  Yelp
//
//  Created by Jonathan Tsai on 9/23/14.
//  Copyright (c) 2014 Hacktoolkit. All rights reserved.
//

import UIKit

protocol FiltersViewControllerDelegate {
    func searchTermDidChange(String)
}

class FiltersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var delegate: FiltersViewControllerDelegate!

    @IBOutlet weak var tableView: UITableView!

    var data: [String]!
    var sectionsExpanded = [Int:Bool]()
    let SECTION_HEADER_HEIGHT = 30

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.reloadData()
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 50;
    }

    func getFilterSection(section: Int) -> FilterSection {
        var filterSection = FILTER_SECTIONS[section]
        return filterSection
    }

    func isSectionExpanded(section: Int) -> Bool {
        var isExpanded: Bool
        var filterSection = getFilterSection(section)
        if let sectionIsExpanded = self.sectionsExpanded[section] {
            isExpanded = sectionIsExpanded
        } else {
            sectionsExpanded[section] = !filterSection.collapsible
            isExpanded = sectionsExpanded[section]!
        }
        return isExpanded
    }

    func toggleSectionExpanded(section: Int) {
        sectionsExpanded[section] = !isSectionExpanded(section)
        self.tableView.reloadData()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var filterSection = getFilterSection(section)
        var numRows: Int
        if filterSection.filterType == FilterType.Segmented {
            numRows = 1
        } else if filterSection.collapsible && !isSectionExpanded(section) {
            numRows = filterSection.numRowsCollapsedDisplay
        } else {
            numRows = filterSection.options.count
        }

        return numRows
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        var numSections = FILTER_SECTIONS.count
        return numSections
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var filterCell: FilterCell

        var section = indexPath.section
        var filterSection = getFilterSection(section)
        switch filterSection.filterType {
        case .Segmented:
            filterCell = tableView.dequeueReusableCellWithIdentifier("SegmentedFilterCell") as SegmentedFilterCell
        case .Switch:
            filterCell = tableView.dequeueReusableCellWithIdentifier("SwitchFilterCell") as SwitchFilterCell
        case .Select:
            filterCell = tableView.dequeueReusableCellWithIdentifier("SelectFilterCell") as SelectFilterCell
        }

        filterCell.filterSection = filterSection
        filterCell.rowNum = indexPath.row
        filterCell.sectionExpanded = isSectionExpanded(section)
        filterCell.render()

        return filterCell
    }

    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var filterSection = getFilterSection(section)
        var headerView = UIView(frame: CGRect(x: 0, y:0, width: 320, height: SECTION_HEADER_HEIGHT))
        headerView.backgroundColor = UIColor(white: 0.8, alpha: 0.8)

        var headerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 320, height: SECTION_HEADER_HEIGHT))
        headerLabel.text = "     \(filterSection.name)"

        headerView.addSubview(headerLabel)

        return headerView
    }

    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(SECTION_HEADER_HEIGHT)
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        var section = indexPath.section
        var filterSection = getFilterSection(section)
        if filterSection.collapsible {
            if filterSection.filterType == FilterType.Select {
                filterSection.selectOption(indexPath.row)
            }
            toggleSectionExpanded(indexPath.section)
        }

        if filterSection.filterType == FilterType.Switch {
            var switchFilterCell = self.tableView(tableView, cellForRowAtIndexPath: indexPath) as SwitchFilterCell
            switchFilterCell.onFilterSwitchFlipped(self)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onCancelButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func onSearchButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
