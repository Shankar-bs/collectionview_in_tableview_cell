//
//  DetailViewController.swift
//  DemoProject
//
//  Created by Shankar B S on 17/02/18.
//  Copyright © 2018 shankar.bs. All rights reserved.
//

import UIKit
class DetailViewController:UIViewController {
    var category:ImageCategory?
    var imageName:String?
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var detailImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "CategoryDetail"
        self.updateViewControllerWithDetails()
    }
    
    func updateViewControllerWithDetails() {
        if let selCategory = self.category, let imageTitle = self.imageName {
            self.descriptionLabel.text = selCategory.catDescription
            self.detailImageView.image = UIImage(named: imageTitle)
        }
    }
    
}
