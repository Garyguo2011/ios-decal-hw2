//
//  KeyboardViewController.swift
//  CalKeyboard
//
//  Created by Gene Yoo on 9/15/15.
//  Copyright © 2015 iOS Decal. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    @IBOutlet var returnKeyboardButton: UIButton!
    @IBOutlet var deleteKeyboardButton: UIButton!
    @IBOutlet var addressKeyboardButton: UIButton!
    @IBOutlet var phoneKeyboardButton: UIButton!
    @IBOutlet var emojisKebyBoardButton: UIButton!
    
    var keyboardView: UIView!

    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadInterface()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    }

    func tapReturn(){
        self.textDocumentProxy.insertText("\n")
    }

    func tapDelete(){
        self.textDocumentProxy.deleteBackward()
    }

    func tapAddress(){
        self.textDocumentProxy.insertText("110 Sproul Hall # 5800 Berkeley, CA 94720-5800")
    }

    func tapPhone(){
        self.textDocumentProxy.insertText("(510)642-6000")
    }

    func tapEmojis(){
        self.textDocumentProxy.insertText("👮😁😂😇😍")
    }

    func loadInterface() {
        let keyboardNib = UINib(nibName: "Keyboard", bundle: nil)
        keyboardView = keyboardNib.instantiateWithOwner(self, options: nil)[0] as! UIView
        keyboardView.frame = view.frame
        view.addSubview(keyboardView)
        view.backgroundColor = keyboardView.backgroundColor
        nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside) // advanceToNextInputMode is already defined in template
        returnKeyboardButton.addTarget(self, action: "tapReturn", forControlEvents: .TouchUpInside)
        deleteKeyboardButton.addTarget(self, action: "tapDelete", forControlEvents: .TouchUpInside)
        addressKeyboardButton.addTarget(self, action: "tapAddress", forControlEvents: .TouchUpInside)
        phoneKeyboardButton.addTarget(self, action: "tapPhone", forControlEvents: .TouchUpInside)
        emojisKebyBoardButton.addTarget(self, action: "tapEmojis", forControlEvents: .TouchUpInside)
    }
}
