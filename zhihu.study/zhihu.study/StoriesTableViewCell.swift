//
//  StoriesTableViewCell.swift
//  zhihu.study
//
//  Created by shawn on 22/7/15.
//  Copyright (c) 2015 shawn. All rights reserved.
//

import UIKit

class StoriesTableViewCell: UITableViewCell {

    @IBOutlet weak var caption: UILabel!
    @IBOutlet weak var thumbview: UIImageView!
    @IBOutlet weak var multiLabel: UILabel!

    var thumburl: String? {
        didSet{
            if let url = NSURL(string: self.thumburl!){
                thumbview.hnk_setImageFromURL(url)
             }
        }
    }
    var multi: Bool = false {
        didSet {
            multiLabel.hidden = !multi
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

