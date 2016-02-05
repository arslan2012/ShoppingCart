//
//  FlatRateStrategy.swift
//  shoppingCart
//
//  Created by ئ‍ارسلان ئابلىكىم on 2/2/16.
//  Copyright © 2016 ئ‍ارسان ئابلىكىم. All rights reserved.
//

import Foundation
class FlatRateStrategy: IPricingStrategy {
    private var discountPerItem : Int8
    init (discount : Int8){
        self.discountPerItem = discount
    }
    func getSubTotal(i: SaleLineItem) -> Double {
        return Double(i.copies)*(i.prodSpec.price - Double(discountPerItem))
    }
    func isKindOfClass() ->String{
        return "减价优惠策略"
    }
}