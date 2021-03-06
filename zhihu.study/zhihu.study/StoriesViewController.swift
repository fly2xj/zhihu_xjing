//
//  StoriesViewController.swift
//  zhihu.study
//
//  Created by shawn on 22/7/15.
//  Copyright (c) 2015 shawn. All rights reserved.
//

import UIKit

class StoriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableview.delegate = self
        tableview.dataSource = self
        tableview.contentInset = UIEdgeInsetsMake(20, 0, 0, 0)
        // Do any additional setup after loading the view.
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        tableview.delegate = nil
        tableview.dataSource = nil
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - tableview datasource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsManager.sharedManager.news[section].news.count
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return newsManager.sharedManager.news.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableview.dequeueReusableCellWithIdentifier("storiesCell", forIndexPath: indexPath) as? StoriesTableViewCell {
            let news = newsManager.sharedManager.news[indexPath.section].news[indexPath.row]
            cell.caption?.text = news.title
            if let image = news.images {
                cell.thumburl = image[0]
            }
            cell.multi = news.multiPic
            return cell
        }
        return StoriesTableViewCell()
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Header"
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return 24
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 106
    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UILabel()
        view.backgroundColor = UIColor(red: 0.098, green: 0.565, blue: 0.827, alpha: 1)
        
        view.textColor = UIColor.whiteColor()
        view.textAlignment = .Center
        
        let formater = NSDateFormatter()
        let news = newsManager.sharedManager.news[section - 1]
        formater.dateFormat = "yyyyMMdd"
        let day = "\(news.date!)"
        print(day)
        if let date = formater.dateFromString(day) {
            formater.dateFormat = "MMM d EEEE"
            view.text = formater.stringFromDate(date)
        }
        return view as UIView
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
