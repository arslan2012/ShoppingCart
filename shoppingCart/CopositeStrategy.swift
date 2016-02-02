//
//  CopositeStrategy.swift
//  shoppingCart
//
//  Created by ئ‍ارسلان ئابلىكىم on 2/2/16.
//  Copyright © 2016 ئ‍ارسان ئابلىكىم. All rights reserved.
//

import Foundation
protocol CopositeStrategy : IPricingStrategy{
    var strategies :[IPricingStrategy]{ get set }
    func add(strat : IPricingStrategy)
    
}