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
  * `sudo gem install cocoapods`
* Install Pods
  * `pod install`
* Set up API keys
  * Create a `secrets.xcconfig` config file based on `secrets.xcconfig.template`
  * Obtain API keys from the [Yelp Developers page](http://www.yelp.com/developers/manage_api_keys) and add the keys to `secrets.xcconfig`
* Run it!

## Features (User Stories)

Time spent: 17 hours

**Search results page**

* [x] Table rows should be dynamic height according to the content height
* [x] Custom cells should have the proper Auto Layout constraints
* [x] Search bar should be in the navigation bar (doesn't have to expand to show location like the real Yelp app does).
* [-] Optional: infinite scroll for restaurant results
* [-] Optional: Implement map view of restaurant results

**Filter page**

Not all of the filters ares supported in the Yelp API

* Filters implemented: category, sort (best match, distance, highest rated), radius (meters), deals (on/off).
* [x] Filters table organized into sections as in the mock. (Price, Most Popular, Distance, Sort by, General Features)
* [x] Use the default UISwitch for on/off states.
* [-] Optional: implement a custom switch
* [-] Radius filter expands as in the real Yelp app
* [50%] Categories show a subset of the full list with a "See All" row to expand. Category list is here: http://www.yelp.com/developers/documentation/category_list (Links to an external site.)
* [50%] Clicking on the "Search" button should dismiss the filters page and trigger the search w/ the new filter settings.

**Restaurant detail page**

* Not implemented
