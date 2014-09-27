//
//  FilterSection.swift
//  Yelp
//
//  Created by Jonathan Tsai on 9/26/14.
//  Copyright (c) 2014 Hacktoolkit. All rights reserved.
//

import Foundation

enum FilterType {
    case Select
    case Segmented
    case Switch
}

class FilterSection {
    var name = ""
    var options: [String]
    var filterType: FilterType
    var collapsible: Bool
    var numRowsCollapsedDisplay: Int
    var optionStates = [String:Bool]()

    init (name:String, filterType: FilterType, options: [String], var isCollapsible: Bool = false, numRowsCollapsedDisplay: Int = 1) {
        self.name = name
        self.filterType = filterType
        self.options = options
        for var i=0; i < options.count; ++i {
            // initially set all options to false
            var option = options[i]
            self.optionStates[option] = false
        }
        if filterType == .Select {
            isCollapsible = true
        }
        self.collapsible = isCollapsible
        self.numRowsCollapsedDisplay = numRowsCollapsedDisplay

        if filterType == .Select {
            // set the first select option to selected
            self.selectOption(0)
        }
    }

    // Switch filters

    func getOptionState(index: Int) -> Bool {
        var option = self.options[index]
        var state = !self.optionStates[option]!
        return state
    }

    func toggleOption(index: Int) -> Bool {
        var option = self.options[index]
        var newState = !self.optionStates[option]!
        self.optionStates[option] = newState
        println("\(option) switched \(newState)")
        return newState
    }

    // Select filters

    func selectOption(index: Int) -> String {
        var selectedOption = self.options[index]
        for option in self.options {
            self.optionStates[option] = option == selectedOption
        }
        println("Selected \(self.name) option: \(selectedOption)")
        return selectedOption
    }

    func getSelectedOption() -> String {
        var selectedOption: String!
        for (option, value) in self.optionStates {
            if value {
                selectedOption = option
                break
            }
        }
        if selectedOption == nil {
            selectedOption = self.selectOption(0)
        }
        return selectedOption!
    }
}

var FILTER_SECTIONS = [
    FilterSection(
        name: "Price",
        filterType: FilterType.Segmented,
        options: [
            "$",
            "$$",
            "$$$",
            "$$$$",
        ]
    ),
    FilterSection(
        name: "Most Popular",
        filterType: FilterType.Switch,
        options: [
            "Open Now",
            "Hot & New",
            "Offering a Deal",
            "Delivery",
        ]
    ),
    FilterSection(
        name: "Distance",
        filterType: FilterType.Select,
        options: [
            "Auto",
            "1 Mile",
            "5 Miles",
            "10 Miles",
            "20 Miles",
            "50 Miles",
        ]
    ),
    FilterSection(
        name: "Sort by",
        filterType: FilterType.Select,
        options: [
            "Best Match",
            // made up values below
            "Guesstimate",
            "Worst Match",
            "I'm Feeling Lucky",
        ]
    ),
    FilterSection(
        name: "General Features",
        filterType: FilterType.Switch,
        options: [
            "Take-out",
            "Good for Groups",
            "Takes Reservations",
        ],
        isCollapsible: true,
        numRowsCollapsedDisplay: 3
    ),
]
