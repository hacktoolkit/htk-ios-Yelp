//
//  YelpCategory.swift
//  Yelp
//
//  Created by Jonathan Tsai on 9/23/14.
//  Copyright (c) 2014 Hacktoolkit. All rights reserved.
//

class YelpCategory {
    var categoryName: String!
    var categoryKey: String!

    init(categoryArray: NSArray) {
        self.categoryName = categoryArray[0] as? String
        self.categoryKey = categoryArray[1] as? String
    }
}
