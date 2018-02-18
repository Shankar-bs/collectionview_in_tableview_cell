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

//  ViewController.swift
//  DemoProject
//
//  Created by shankar.bs on 28/12/17.
//  Copyright © 2017 shankar.bs. All rights reserved.
//

import UIKit
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var categories = [ImageCategory]() //to hold the data to be displayed
    @IBOutlet weak var myTableView: UITableView!
    let headerReuseId = "TableHeaderViewReuseId"
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title  = "My Best Images"
        // Do any additional setup after loading the view, typically from a nib.
        let headerNib = UINib(nibName: "CustomHeaderView", bundle: nil)
        self.myTableView.register(headerNib, forHeaderFooterViewReuseIdentifier: headerReuseId)
        setupData()
        self.myTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: Data initlisers methods
    func setupData() {
        for index in 0..<5 {
            var infoDict = [String:Any]()
            infoDict = dataForIndex(index: index)
            let aCategory = ImageCategory(withInfo: infoDict)
            categories.append(aCategory)
        }
    }
    
    func dataForIndex(index:Int) -> [String:Any] {
        var data = [String:Any]()
        switch index {
        case 0:
            data["cat_name"] = "Birds"
            data["cat_id"]   = "\(index)"
            data["cat_description"] = "birds pics shot in the Forest"
            data["cat_items"] = ["Image_0","Image_1","Image_2","Image_3","Image_4"]
        case 1:
            data["cat_name"] = "Animals"
            data["cat_id"]   = "\(index)"
            data["cat_description"] = "Animals pics shot in the Forest"
            data["cat_items"] = ["Image_5","Image_6","Image_7","Image_8","Image_9"]
        case 2:
            data["cat_name"] = "Fishes"
            data["cat_id"]   = "\(index)"
            data["cat_description"] = "Fishes pics shot in the Lake"
            data["cat_items"] = ["Image_10","Image_11","Image_12","Image_13","Image_14"]
        case 3:
            data["cat_name"] = "Plants"
            data["cat_id"]   = "\(index)"
            data["cat_description"] = "Plants pics shot in the Forest"
            data["cat_items"] = ["Image_15","Image_16","Image_17","Image_18","Image_19"]
        case 4:
            data["cat_name"] = "Trees"
            data["cat_id"]   = "\(index)"
            data["cat_description"] = "Trees pics shot in the Forest"
            data["cat_items"] = ["Image_20","Image_21","Image_22","Image_23","Image_24"]
        default:
            data["cat_name"] = "RandomPics"
            data["cat_id"]   = "\(index)"
            data["cat_description"] = "Random pics"
            data["cat_items"] = ["Image_2","Image_7","Image_12","Image_16","Image_5"]
        }
        return data
    }
    
    //MARK:Tableview Delegates and Datasource Methods
    func numberOfSections(in tableView: UITableView) -> Int {
       return  categories.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as? CustomTableViewCell
        if cell == nil {
            cell = CustomTableViewCell.customCell
        }
        let aCategory = self.categories[indexPath.section]
        cell?.updateCellWith(category: aCategory)
        cell?.cellDelegate = self
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var view = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerReuseId) as? CustomHeaderView
        if view == nil {
            view = CustomHeaderView.customView
        }
        let aCategory = self.categories[section]
        view?.headerLabel.text = aCategory.name
        return view
    }
}

extension ViewController:CustomCollectionCellDelegate {
    func collectionView(collectioncell: CustomCollectionViewCell?, didTappedInTableview TableCell: CustomTableViewCell) {
        if let cell = collectioncell, let selCategory = TableCell.aCategory {
            if let imageName = cell.cellImageName {
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let detailController = storyBoard.instantiateViewController(withIdentifier:"DetailViewController") as? DetailViewController
                detailController?.category = selCategory
                detailController?.imageName = imageName
                self.navigationController?.pushViewController(detailController!, animated: true)
                
            }
        }
    }
}

