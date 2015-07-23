//
//  LaunchImageViewController.swift
//  zhihu.study
//
//  Created by shawn on 22/7/15.
//  Copyright (c) 2015 shawn. All rights reserved.
//

import UIKit
import Haneke
import SwiftyJSON

struct URL {
    static let lanuchImage = "https://news-at.zhihu.com/api/4/start-image/640*1136?client=0"
}

class LaunchImageViewController: UIViewController
{
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        prefersStatusBarHidden()
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cacheLaunchImage()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(10, delay: 0, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
            self.imageView.transform = CGAffineTransformMakeScale(1.2, 1.2)
        }, completion: nil)
    }
    
    func cacheLaunchImage() {
        let defaults = NSUserDefaults.standardUserDefaults()
        if let image = defaults.stringForKey("launchImageUrl"),
            let imageUrl = NSURL(string: image){
                imageView.hnk_setImageFromURL(imageUrl)
        } else {
            dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0)) {
                if let url = NSURL(string: URL.lanuchImage),
                    let data = NSData(contentsOfURL: url) {
                    let json = JSON(data: data)
                        if let newUrl = json["img"].string {
                            defaults.setValue(newUrl, forKey: "launchImageUrl")
                        }
                }
            }
        }
    }
}
