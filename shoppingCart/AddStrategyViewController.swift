//
//  AddStrategyViewController.swift
//  shoppingCart
//
//  Created by ئ‍ارسلان ئابلىكىم on 2/3/16.
//  Copyright © 2016 ئ‍ارسان ئابلىكىم. All rights reserved.
//

import Cocoa

class AddStrategyViewController: NSViewController {
    @IBOutlet weak var TypeBox: NSComboBoxCell!
    @IBOutlet weak var NumLable: NSTextField!
    @IBOutlet weak var num: NSTextField!
    @IBOutlet weak var ItemTypeBox: NSComboBox!
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
        }else{
            Core.sharedInstance.addSimpleStrategy(ItemTypeBox.stringValue, stattype: TypeBox.stringValue, discount: Int8(num.stringValue)!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ItemTypeBox.addItemsWithObjectValues(Core.sharedInstance.getTypes())
        
        // Do any additional setup after loading the view.
    }
    
    override var representedObject: AnyObject? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    
}