//
//  AddStrategyViewController.swift
//  shoppingCart
//
//  Created by ئ‍ارسلان ئابلىكىم on 2/3/16.
//  Copyright © 2016 ئ‍ارسان ئابلىكىم. All rights reserved.
//

import Cocoa

class AddStrategyViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource {
    @IBOutlet weak var TypeBox: NSComboBoxCell!
    @IBOutlet weak var NumLable: NSTextField!
    @IBOutlet weak var num: NSTextField!
    @IBOutlet weak var ItemTypeBox: NSComboBox!
    @IBOutlet weak var ComplexStratTable: NSTableView!
    @IBOutlet weak var ComplexItemTypeBox: NSComboBox!
    @IBAction func TypeBoxAct(sender: NSComboBoxCell) {
        if TypeBox.stringValue == "无优惠策略"{
            NumLable.hidden = true
            num.hidden = true
        }else{
            NumLable.hidden = false
            num.hidden = false
        }
    }
    @IBAction func SimpleSubmit(sender: NSButton) {
        if TypeBox.stringValue == "无优惠策略" {
            Core.sharedInstance.addSimpleStrategy(ItemTypeBox.stringValue, stattype: TypeBox.stringValue, discount: 0)
            let a = NSAlert()
            a.messageText = "添加成功！"
            a.runModal()
        }else if ItemTypeBox.stringValue == "" {
            let a = NSAlert()
            a.messageText = "您未选择策略，无法添加！"
            a.runModal()
        }else{
            Core.sharedInstance.addSimpleStrategy(ItemTypeBox.stringValue, stattype: TypeBox.stringValue, discount: Int8(num.stringValue)!)
            let a = NSAlert()
            a.messageText = "添加成功！"
            a.runModal()
        }
    }
    @IBAction func ComplexSubmit(sender: NSButton) {
        var tmp = [IPricingStrategy]()
        for i in 0 ..< PricingStrategyFactory.sharedInstance.strategies.count {
            let cell = ComplexStratTable.viewAtColumn(0, row: i, makeIfNecessary: true) as! NSTableCellView
            let tmpButton = cell.subviews[0] as! NSButton
            if tmpButton.state == NSOnState {
                tmp.append(PricingStrategyFactory.sharedInstance.strategies[Core.sharedInstance.getTypes()[i]]!)
            }
        }
        if ComplexItemTypeBox.stringValue != "" {
            Core.sharedInstance.addCompositeStrategy(ComplexItemTypeBox.stringValue, strategies: tmp)
            let a = NSAlert()
            a.messageText = "添加成功！"
            a.runModal()
        }else{
            let a = NSAlert()
            a.messageText = "您未选择策略，无法添加！"
            a.runModal()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ItemTypeBox.addItemsWithObjectValues(Core.sharedInstance.getTypes())
        ComplexItemTypeBox.addItemsWithObjectValues(Core.sharedInstance.getTypes())
        ComplexStratTable.setDataSource(self)
        ComplexStratTable.setDelegate(self)
        
        // Do any additional setup after loading the view.
    }
    
    override var representedObject: AnyObject? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        return PricingStrategyFactory.sharedInstance.strategies.count
    }
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        if let identifier = tableColumn?.identifier {
            if identifier == "CheckBoxColumn"{
                let Cell: NSTableCellView = tableView.makeViewWithIdentifier("CheckBoxCell",owner: self) as! NSTableCellView
                return Cell
            }else if identifier == "TypeColumn"{
                let Cell: NSTableCellView = tableView.makeViewWithIdentifier("TypeCell",owner: self) as! NSTableCellView
                Cell.textField?.stringValue = Core.sharedInstance.getTypes()[row]
                return Cell
            }else if identifier == "StratColumn"{
                let Cell: NSTableCellView = tableView.makeViewWithIdentifier("StratCell",owner: self) as! NSTableCellView
                Cell.textField?.stringValue = PricingStrategyFactory.sharedInstance.strategies[Core.sharedInstance.getTypes()[row]]!.isKindOfClass()
                return Cell
            }
        }
        return nil
    }
    
    
}