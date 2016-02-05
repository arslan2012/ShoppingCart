//
//  IPricingStrategy.swift
//  shoppingCart
//
//  Created by ئ‍ارسلان ئابلىكىم on 2/2/16.
//  Copyright © 2016 ئ‍ارسان ئابلىكىم. All rights reserved.
//

import Foundation
protocol IPricingStrategy{
    func getSubTotal(i: SaleLineItem) ->Double
    func isKindOfClass() ->String
}