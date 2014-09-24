htk-ios-Yelp
============

This is a basic Yelp client.

[CodePath iOS Bootcamp](http://codepath.com/iosbootcamp) September 2014 - Week 2 Project

## GIF Screen Cap

Here's an animated GIF (made with [LiceCAP](http://www.cockos.com/licecap/)) of what it looks like:

![](https://raw.githubusercontent.com/hacktoolkit/htk-ios-Yelp/master/yelp_screencap_jontsai_20140923.gif)

## Download and Build Instructions

* Clone the repository
* Install [CocoaPods](http://cocoapods.org/)

  `sudo gem install cocoapods`
* Install Pods

  `pod install`
* Obtain API keys from the [Yelp Developers page](http://www.yelp.com/developers/manage_api_keys) and add the keys to one of the Swift files in the project

  `let API_YELP_CONSUMER_KEY = "1234567890abcdefg"`
  `let API_YELP_CONSUMER_SECRET = "1234567890abcdefg"`
  `let API_YELP_TOKEN = "1234567890abcdefg"`
  `let API_YELP_TOKEN_SECRET = "1234567890abcdefg"`
* Run it!

## Features (User Stories)

Time spent: 7 hours

'''Search results page'''

* Table rows should be dynamic height according to the content height (in progress)
* Custom cells should have the proper Auto Layout constraints (partially done)
* Search bar should be in the navigation bar (doesn't have to expand to show location like the real Yelp app does). (not done)
* Optional: infinite scroll for restaurant results (not done)
* Optional: Implement map view of restaurant results (not done)

'''Filter page''' (Not implemented)

* (Unfortunately, not all the filters are supported in the Yelp API)
* The filters you should actually have are: category, sort (best match, distance, highest rated), radius (meters), deals (on/off). (not done)
* The filters table should be organized into sections as in the mock.
* You can use the default UISwitch for on/off states. Optional: implement a custom switch
* Radius filter should expand as in the real Yelp app
* Categories should show a subset of the full list with a "See All" row to expand. Category list is here: http://www.yelp.com/developers/documentation/category_list (Links to an external site.)
* Clicking on the "Search" button should dismiss the filters page and trigger the search w/ the new filter settings.

'''Restaurant detail page'''

* Not implemented
