//
//  AddBookViewController.swift
//  shoppingCart
//
//  Created by ئ‍ارسلان ئابلىكىم on 2/3/16.
//  Copyright © 2016 ئ‍ارسان ئابلىكىم. All rights reserved.
//

import Cocoa

class AddBookViewController: NSViewController {

    @IBOutlet weak var price: NSFormCell!
    @IBOutlet weak var name: NSFormCell!
    @IBOutlet weak var type: NSFormCell!
    @IBOutlet weak var isbn: NSFormCell!
    @IBOutlet weak var submit: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        price.preferredTextFieldWidth = 100
        
        // Do any additional setup after loading the view.
    }
    
    override var representedObject: AnyObject? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    @IBAction func submitted(sender: NSButton) {
        if let _ = Double(self.price.stringValue){
        if (self.name.stringValue != "") || (self.type.stringValue != "") || (self.isbn.stringValue != ""){
            Core.sharedInstance.addBook(Double(self.price.stringValue)!,title: self.name.stringValue, type: self.type.stringValue,isbn: self.isbn.stringValue)
            let a = NSAlert()
            a.messageText = "添加成功！"
            a.runModal()
        }else{
            let a = NSAlert()
            a.messageText = "您的输入有误，无法添加！"
            a.runModal()
            }
        }else{
            let a = NSAlert()
            a.messageText = "您的输入有误，无法添加！"
            a.runModal()
        }
    }
    
}