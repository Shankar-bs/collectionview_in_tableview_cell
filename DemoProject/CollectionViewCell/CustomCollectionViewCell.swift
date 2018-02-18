//
//  CustomCollectionViewCell.swift
//  DemoProject
//
//  Created by Shankar B S on 17/02/18.
//  Copyright © 2018 shankar.bs. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellImageView: UIImageView!
    var cellImageName:String?
    class var CustomCell : CustomCollectionViewCell {
        let cell = Bundle.main.loadNibNamed("CustomCollectionViewCell", owner: self, options: nil)?.last
        return cell as! CustomCollectionViewCell
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = UIColor.red
        
    }
    
    func updateCellWithImage(name:String) {
        self.cellImageName = name
        self.cellImageView.image = UIImage(named: name)
    }

}
