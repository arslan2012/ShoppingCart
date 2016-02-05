//
//  NoDiscountStrategy.swift
//  shoppingCart
//
//  Created by ئ‍ارسلان ئابلىكىم on 2/2/16.
//  Copyright © 2016 ئ‍ارسان ئابلىكىم. All rights reserved.
//

import Foundation
class NoDiscountStrategy: IPricingStrategy {
    required init(){}
    func getSubTotal(i: SaleLineItem) -> Double {
        return Double(i.copies)*i.prodSpec.price
    }
    func isKindOfClass() ->String{
        return "无优惠策略"
    }
}