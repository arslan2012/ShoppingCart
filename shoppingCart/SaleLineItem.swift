//
//  SaleLineItem.swift
//  shoppingCart
//
//  Created by ئ‍ارسلان ئابلىكىم on 2/2/16.
//  Copyright © 2016 ئ‍ارسان ئابلىكىم. All rights reserved.
//

import Foundation
class SaleLineItem {
    var copies : Int8
    let prodSpec : productSpecification
    private let strategy : IPricingStrategy
    init(copies : Int8,prodSpec : productSpecification){
        self.copies = copies
        self.prodSpec = prodSpec
        self.strategy = PricingStrategyFactory.sharedInstance.strategies[prodSpec.type]!
    }
    func getSubTotal() -> Double{
        return strategy.getSubTotal(self);
    }
}