//
//  ViewController.swift
//  Yelp
//
//  Created by Jonathan Tsai on 9/22/14.
//  Copyright (c) 2014 Hacktoolkit. All rights reserved.
//

import UIKit

class BusinessResultsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FiltersViewControllerDelegate, UISearchBarDelegate {
    var yelpClient: YelpClient!

    @IBOutlet weak var filterBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var businessSearchBar: UISearchBar!

    var businesses: [YelpBusinessResult]! = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numRows = self.businesses.count
        return numRows
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var businessResultCell = tableView.dequeueReusableCellWithIdentifier("BusinessResultCell") as BusinessResultCell
        let business = businesses[indexPath.row]
        businessResultCell.resultNum = indexPath.row + 1
        businessResultCell.business = business
        return businessResultCell
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var businessResultCell = self.tableView(tableView, cellForRowAtIndexPath: indexPath)
        businessResultCell.layoutIfNeeded()
        var size = businessResultCell.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
        var height = size.height + 1
        return height
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        var filtersNavigationController = segue.destinationViewController as UINavigationController
        var filtersViewController = filtersNavigationController.viewControllers[0] as FiltersViewController
        filtersViewController.delegate = self
    }

    // UISearchBarDelegate
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        searchTermDidChange(searchText)
    }

    func searchTermDidChange(query: String) {
        YelpBusinessResult.searchWithQuery(query, {
            (businesses: [YelpBusinessResult]!, error: NSError!) -> Void in
            if businesses != nil {
                self.businesses = businesses
                self.tableView.reloadData()
            }
            if error != nil {
                println(error)
            }
        })
    }
}

