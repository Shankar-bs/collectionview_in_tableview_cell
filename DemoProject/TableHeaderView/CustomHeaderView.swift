//
//  CustomHeaderView.swift
//  DemoProject
//
//  Created by Shankar B S on 17/02/18.
//  Copyright © 2018 shankar.bs. All rights reserved.
//

import UIKit
class CustomHeaderView: UITableViewHeaderFooterView {
    @IBOutlet weak var headerLabel: UILabel!
    class var customView : CustomHeaderView {
        let cell = Bundle.main.loadNibNamed("CustomHeaderView", owner: self, options: nil)?.last
        return cell as! CustomHeaderView
    }
    
   override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = UIColor.white
    }
}
