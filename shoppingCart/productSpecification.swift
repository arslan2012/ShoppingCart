//
//  productSpecification.swift
//  shoppingCart
//
//  Created by ئ‍ارسلان ئابلىكىم on 2/2/16.
//  Copyright © 2016 ئ‍ارسان ئابلىكىم. All rights reserved.
//

import Foundation
class productSpecification {
    var price : Double
    var title : String
    var type : String
    var isbn : String
    init(price : Double, title : String, type : String, isbn : String){
        self.price = price
        self.title = title
        self.type = type
        self.isbn = isbn
    }
    
}