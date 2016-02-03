//
//  Core.swift
//  shoppingCart
//
//  Created by ئ‍ارسلان ئابلىكىم on 2/2/16.
//  Copyright © 2016 ئ‍ارسان ئابلىكىم. All rights reserved.
//

import Foundation
class Core {
    private var books : [productSpecification]
    private var sales : Sale
    static let sharedInstance = Core()
    private init(){
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
    func getBookByIsbn(isbn : String)->productSpecification?{
        for book in books{
            if (book.isbn == isbn){
                return book
            }
        }
        return nil
    }
    func getTypes()->[String]{
        var tmp = [String]()
        for book in books{
            var flag = true
            for type in tmp{
                if book.type == type{
                    flag = false
                }
            }
            if flag == true {
                tmp.append(book.type)
            }
        }
        return tmp
    }
    func buyBook(num : Int8, isbn : String)->Bool{
        if ((getBookByIsbn(isbn)) != nil) {
            sales.addItem(SaleLineItem(copies: num, prodSpec: getBookByIsbn(isbn)!))
            return true
        }else {
            return false
        }
    }
}