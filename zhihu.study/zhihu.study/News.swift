//
//  News.swift
//  zhihu.study
//
//  Created by shawn on 23/7/15.
//  Copyright (c) 2015 shawn. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class News {
    let images: [String]?
    let title: String
    let type: Int = 0
    let id: Int
    let gaPrefix: Int?
    var multiPic: Bool = false
    var readed = false
    
    init(id:Int, title: String, images: [String]? = nil, multipic: Bool? = false, gaprefix: Int? = 0) {
        self.images = images
        self.title = title
        self.id = id
        self.multiPic = multipic!
        self.gaPrefix = gaprefix
    }
}



class NewsList {
    var date: Int?
    var topnews: [News]?
    var news: [News]?
    
    init() {
    }
    init(json: JSON) {
        date = json["date"].string?.toInt()
        if let stories = json["stories"].array {
            for story in stories {
                
            }
        }
    }

}

private let _allnews = newsManager()
class newsManager {

    var news: [Int:NewsList]?

    class var sharedManager: newsManager {
        return _allnews
    }
    
    func fetchNewsWithDate(date:Int, complete: () -> Void) {
        

        complete()
    }
    
    func fetchTodayNews(complete: ()->Void) {
        
        Alamofire.Manager.sharedInstance.request(.GET, url.latestNews, parameters: nil, encoding: ParameterEncoding.URL).responseJSON(options: NSJSONReadingOptions.MutableContainers) { (_, _, data, error) -> Void in
            if let result: AnyObject = data{
                let json = JSON(result)
                let list = NewsList(json: json)
                self.news?[list.date!] = list
            }
                
        }
        complete()
    }
}