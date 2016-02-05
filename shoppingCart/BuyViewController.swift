//
//  BuyViewController.swift
//  shoppingCart
//
//  Created by ئ‍ارسلان ئابلىكىم on 2/3/16.
//  Copyright © 2016 ئ‍ارسان ئابلىكىم. All rights reserved.
//

import Cocoa

class BuyViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource {
    @IBOutlet weak var BuyTable: NSTableView!
    @IBOutlet weak var ShoppingCartTable: NSTableView!
    @IBOutlet weak var PriceSum: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ShoppingCartTable.reloadData()
        PriceSum.stringValue = "总价:"+String(Core.sharedInstance.sales.getTotal())
        BuyTable.setDataSource(self)
        BuyTable.setDelegate(self)
        ShoppingCartTable.setDataSource(self)
        ShoppingCartTable.setDelegate(self)
        // Do any additional setup after loading the view.
    }
    
    override var representedObject: AnyObject? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        if let identifier = tableView.identifier {
            if identifier == "BuyTable"{
                return Core.sharedInstance.books.count
            }else if identifier == "ShoppingCartTable" {
                return Core.sharedInstance.sales.items.count
            }
        }
        return 0
    }
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        if let identifier = tableColumn?.identifier {
            if identifier == "BuyBookNameColumn"{
                let Cell: NSTableCellView = tableView.makeViewWithIdentifier("BuyBookNameCell",owner: self) as! NSTableCellView
                Cell.textField?.stringValue = Core.sharedInstance.books[row].title
                return Cell
            }else if identifier == "BuyBookPriceColumn"{
                let Cell: NSTableCellView = tableView.makeViewWithIdentifier("BuyBookPriceCell",owner: self) as! NSTableCellView
                Cell.textField?.stringValue = String(Core.sharedInstance.books[row].price)
                return Cell
            }else if identifier == "BuyBookSumColumn"{
                let Cell: NSTableCellView = tableView.makeViewWithIdentifier("BuyBookSumCell",owner: self) as! NSTableCellView
                return Cell
            }else if identifier == "BuyButtonColumn"{
                let Cell: NSTableCellView = tableView.makeViewWithIdentifier("BuyButtonCell",owner: self) as! NSTableCellView
                return Cell
            }else if identifier == "CartBookNameColumn"{
                let Cell: NSTableCellView = tableView.makeViewWithIdentifier("CartBookNameCell",owner: self) as! NSTableCellView
                Cell.textField?.stringValue = Core.sharedInstance.sales.items[row].prodSpec.title
                return Cell
            }else if identifier == "CartBookPriceColumn"{
                let Cell: NSTableCellView = tableView.makeViewWithIdentifier("CartBookPriceCell",owner: self) as! NSTableCellView
                Cell.textField?.stringValue = String(Core.sharedInstance.sales.items[row].prodSpec.price)
                return Cell
            }else if identifier == "CartBookSumColumn"{
                let Cell: NSTableCellView = tableView.makeViewWithIdentifier("CartBookSumCell",owner: self) as! NSTableCellView
                Cell.textField?.stringValue = String(Core.sharedInstance.sales.items[row].copies)
                return Cell
            }
        }
        return nil
    }
    @IBAction func Buying(sender: NSButton) {
        let row = BuyTable.rowForView(sender)
        let cell = BuyTable.viewAtColumn(2, row: row, makeIfNecessary: true) as! NSTableCellView
        let tmp = cell.subviews[0] as! NSTextField
        if let a = Int8(tmp.stringValue){
            if !Core.sharedInstance.buyBook(a, isbn: Core.sharedInstance.books[row].isbn) {
                let a = NSAlert()
                a.messageText = "该商品未设置策略，无法添加！"
                a.runModal()
            }
        }else{
            let a = NSAlert()
            a.messageText = "您的输入有误，无法添加！"
            a.runModal()
        }
        ShoppingCartTable.reloadData()
        PriceSum.stringValue = "总价:"+String(Core.sharedInstance.sales.getTotal())
    }
}