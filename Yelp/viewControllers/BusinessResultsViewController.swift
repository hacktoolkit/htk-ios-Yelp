//
//  ViewController.swift
//  Yelp
//
//  Created by Jonathan Tsai on 9/22/14.
//  Copyright (c) 2014 Hacktoolkit. All rights reserved.
//

import UIKit

class BusinessResultsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FiltersViewControllerDelegate {
    var yelpClient: YelpClient!

    @IBOutlet weak var tableView: UITableView!

    var businesses: [YelpBusinessResult]! = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.delegate = self
        self.tableView.dataSource = self

        self.searchDisplayController?.displaysSearchBarInNavigationBar = true
        searchTermDidChange()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numRows = self.businesses.count
        return numRows
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var businessResultCell = tableView.dequeueReusableCellWithIdentifier("BusinessResultCell") as BusinessResultCell
        let business = businesses[indexPath.row]
        businessResultCell.business = business
        return businessResultCell
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

    func searchTermDidChange() {
        YelpBusinessResult.searchWithQuery("Thai", {
            (businesses: [YelpBusinessResult]!, error: NSError!) -> Void in
            if businesses != nil {
                self.businesses = businesses
                println(businesses)
                self.tableView.reloadData()
            }
            if error != nil {
                println(error)
            }
        })
    }
}

