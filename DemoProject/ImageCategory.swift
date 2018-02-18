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
//  ImageCategory.swift
//  DemoProject
//
//  Created by shankar.bs on 28/12/17.
//  Copyright © 2017 shankar.bs. All rights reserved.
//
import Foundation
struct CategoryConstants {
    static let category_ID = "cat_id"
    static let category_Description = "cat_description"
    static let category_Name = "cat_name"
    static let category_Items = "cat_items"
}


class ImageCategory {
    let name:String
    let catId:String
    let catDescription:String
    var cayegoryItems:[String] //this will holds the
    init(withInfo infoDict:[String:Any]) {
        self.name = infoDict[CategoryConstants.category_Name] as! String
        self.catId = infoDict[CategoryConstants.category_ID] as! String
        self.catDescription = infoDict[CategoryConstants.category_Description] as! String
        self.cayegoryItems = infoDict[CategoryConstants.category_Items] as! [String]
    }
}
