//
//  PricingStrategyFactory.swift
//  shoppingCart
//
//  Created by ئ‍ارسلان ئابلىكىم on 2/2/16.
//  Copyright © 2016 ئ‍ارسان ئابلىكىم. All rights reserved.
//

import Foundation
class PricingStrategyFactory {
    var strategies = Dictionary<String,IPricingStrategy>()
    static let sharedInstance = PricingStrategyFactory()
    private init() {}
}