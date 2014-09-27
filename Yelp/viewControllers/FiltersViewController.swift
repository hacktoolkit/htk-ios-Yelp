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
    var sections = [
        "Price",
        "Most Popular",
        "Distance",
        "Sort by",
        "General Features"
    ]
    var sectionsExpanded = [Int:Bool]()
    let DEFAULT_IS_EXPANDED = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        data = [
            "Jon",
            "Tim",
            "Sam",
            "Deepak",
            "Jimmy",
            "Darrel",
            "Jonah"
        ]
        self.tableView.reloadData()
    }

    func isSectionExpanded(section: Int) -> Bool {
        var isExpanded: Bool
        if let sectionIsExpanded = self.sectionsExpanded[section] {
            isExpanded = sectionIsExpanded
        } else {
            sectionsExpanded[section] = DEFAULT_IS_EXPANDED
            isExpanded = sectionsExpanded[section]!
        }
        return isExpanded
    }

    func toggleSectionExpanded(section: Int) {
        sectionsExpanded[section] = !isSectionExpanded(section)
        self.tableView.reloadData()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numRows = isSectionExpanded(section) ? data.count : 1
        return numRows
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        var numSections = self.sections.count
        return numSections
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var filterCell = tableView.dequeueReusableCellWithIdentifier("FilterCell") as FilterCell
        var name = data[indexPath.row]
        filterCell.name = name
        return filterCell
    }

    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var headerView = UIView(frame: CGRect(x: 0, y:0, width: 320, height: 50))
        headerView.backgroundColor = UIColor(white: 0.8, alpha: 0.8)

        var headerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        headerLabel.text = "\(self.sections[section])"

        headerView.addSubview(headerLabel)

        return headerView
    }

    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        toggleSectionExpanded(indexPath.section)
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
