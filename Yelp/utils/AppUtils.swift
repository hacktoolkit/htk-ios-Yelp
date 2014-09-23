//
//  AppUtils.swift
//  Yelp
//
//  Created by Jonathan Tsai on 9/23/14.
//  Copyright (c) 2014 Hacktoolkit. All rights reserved.
//

class ImageUtils {
    var imageCache = [String: UIImage]()

    class var sharedInstance : ImageUtils {
        struct Static {
            static var token : dispatch_once_t = 0
            static var instance : ImageUtils? = nil
        }
        dispatch_once(&Static.token) {
            Static.instance = ImageUtils()
        }
        return Static.instance!
    }

    func displayImageUrl(imageUrl: String, imageView: UIImageView) {
        var urlRequest = NSURLRequest(URL: NSURL(string: imageUrl))
        imageView.setImageWithURLRequest(
            urlRequest,
            placeholderImage: nil,
            success: {
                (request: NSURLRequest!, response: NSHTTPURLResponse!, image: UIImage!) -> Void in
                imageView.image = image
                self.storeImageToCache(imageUrl, image: image)
            },
            failure: {
                (request: NSURLRequest!, response: NSHTTPURLResponse!, error: NSError!) -> Void in
                displayNetworkErrorMessage()
            }
        )
    }

    func storeImageToCache(imageUrl: String, image: UIImage) {
        self.imageCache[imageUrl] = image
    }
}

func displayNetworkErrorMessage() {
    TSMessage.showNotificationWithTitle(
        "Network error",
        subtitle: "Couldn't connect to the server. Check your network connection.",
        type: TSMessageNotificationType.Error
    )
}
