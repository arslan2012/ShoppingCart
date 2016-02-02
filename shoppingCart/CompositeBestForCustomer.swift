//
//  CompositeBestForCustomer.swift
//  shoppingCart
//
//  Created by ئ‍ارسلان ئابلىكىم on 2/2/16.
//  Copyright © 2016 ئ‍ارسان ئابلىكىم. All rights reserved.
//

import Foundation
class CompositeBestForCustomer: CopositeStrategy {
    var strategies :[IPricingStrategy]
    init(strategies :[IPricingStrategy]){
        self.strategies = strategies
    }
    init(){
        self.strategies = [IPricingStrategy]()
    }
    func add(strat: IPricingStrategy) {
            self.strategies.append(strat)
    }
    func getSubTotal(i: SaleLineItem) -> Double {
        var min = 9999.0
        for strategy in strategies{
            if (strategy.getSubTotal(i) < min){
                min = strategy.getSubTotal(i)
            }
        }
        return min
    }
}