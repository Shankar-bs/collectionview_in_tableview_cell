//MIT License
//
//Copyright (c) 2018 Shankar BS
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//SOFTWARE.

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
