//
//  Core.swift
//  shoppingCart
//
//  Created by ئ‍ارسلان ئابلىكىم on 2/2/16.
//  Copyright © 2016 ئ‍ارسان ئابلىكىم. All rights reserved.
//

import Foundation
class core {
    private var books : [productSpecification]
    private var sales : Sale
    init(){
        books = [productSpecification]()
        sales = Sale()
    }
    func addBook(price : Double, title : String, type : String, isbn : String){
        books.append(productSpecification(price : price, title : title, type : type, isbn : isbn))
    }
    func addCompositeStrategy(type : String,strategies : [IPricingStrategy]){
        PricingStrategyFactory.sharedInstance.strategies[type] = CompositeBestForCustomer(strategies: strategies)
    }
    func addSimpleStrategy(type : String, stattype : String, discount : Int8){
        switch(stattype){
        case "PercentageStrategy":
            PricingStrategyFactory.sharedInstance.strategies[type] = PercentageStrategy(discount: discount)
            break
        case "FlatRateStrategy":
            PricingStrategyFactory.sharedInstance.strategies[type] = FlatRateStrategy(discount: discount)
            break
        case "NoDiscountStrategy":
            PricingStrategyFactory.sharedInstance.strategies[type] = NoDiscountStrategy()
            break
        default:
            break
        }
    }
    func deleteStrategy(type : String){
        PricingStrategyFactory.sharedInstance.strategies.removeValueForKey(type)
    }
    func getBook(isbn : String)->productSpecification?{
        for book in books{
            if (book.isbn == isbn){
                return book
            }
        }
        return nil
    }
    func buyBook(num : Int8, isbn : String){
        if ((getBook(isbn)) != nil) {
            sales.addItem(SaleLineItem(copies: num, prodSpec: getBook(isbn)!))
        }
    }
}