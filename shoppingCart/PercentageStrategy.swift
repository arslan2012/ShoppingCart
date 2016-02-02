//
//  PercentageStrategy.swift
//  shoppingCart
//
//  Created by ئ‍ارسلان ئابلىكىم on 2/2/16.
//  Copyright © 2016 ئ‍ارسان ئابلىكىم. All rights reserved.
//

import Foundation
class PercentageStrategy: IPricingStrategy {
    private var discountPercentage : Int8
    init (discount : Int8){
        self.discountPercentage = discount
    }
    func getSubTotal(i: SaleLineItem) -> Double {
        return Double(i.copies)*i.prodSpec.price*(100-Double(discountPercentage))/100
    }
}