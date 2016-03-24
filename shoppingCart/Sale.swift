//
//  Sale.swift
//  shoppingCart
//
//  Created by ئ‍ارسلان ئابلىكىم on 2/2/16.
//  Copyright © 2016 ئ‍ارسان ئابلىكىم. All rights reserved.
//

import Foundation
class Sale {
    var items : [SaleLineItem]
    init(){
        items = [SaleLineItem]()
    }
    func addItem(i : SaleLineItem){
        var index = 0
        for item in items{
            index += 1
            if item.prodSpec.isbn == i.prodSpec.isbn {
                item.copies += i.copies
                return
            }
        }
        items.append(i)
    }
    func getTotal()->Double{
        var sum = 0.0
        for item in items{
            sum+=item.getSubTotal()
        }
        return sum
    }
}