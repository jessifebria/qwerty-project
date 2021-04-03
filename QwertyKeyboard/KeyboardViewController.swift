//
//  KeyboardViewController.swift
//  QwertyKeyboard
//
//  Created by Jessi Febria on 01/04/21.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var q: UIButton!
    @IBOutlet weak var w: UIButton!
    @IBOutlet weak var e: UIButton!
    @IBOutlet weak var r: UIButton!
    @IBOutlet weak var t: UIButton!
    @IBOutlet weak var y: UIButton!
    @IBOutlet weak var u: UIButton!
    @IBOutlet weak var i: UIButton!
    @IBOutlet weak var o: UIButton!
    @IBOutlet weak var p: UIButton!
    @IBOutlet weak var a: UIButton!
    @IBOutlet weak var s: UIButton!
    @IBOutlet weak var d: UIButton!
    @IBOutlet weak var f: UIButton!
    @IBOutlet weak var g: UIButton!
    @IBOutlet weak var h: UIButton!
    @IBOutlet weak var j: UIButton!
    @IBOutlet weak var k: UIButton!
    @IBOutlet weak var l: UIButton!
    @IBOutlet weak var z: UIButton!
    @IBOutlet weak var x: UIButton!
    @IBOutlet weak var c: UIButton!
    @IBOutlet weak var v: UIButton!
    @IBOutlet weak var b: UIButton!
    @IBOutlet weak var n: UIButton!
    @IBOutlet weak var m: UIButton!
    @IBOutlet weak var del: UIButton!
    @IBOutlet weak var space: UIButton!
    @IBOutlet weak var `return`: UIButton!
    @IBOutlet weak var numb: UIButton!
    @IBOutlet weak var Upper: UIButton!
  
    
    @IBOutlet weak var viewHuruf: UIView!
    
    @IBOutlet weak var viewAngka: UIView!
    
    
    @IBAction func qButton(_ sender: UIButton) {
        self.textDocumentProxy.insertText("q")
    }
    
    @IBAction func wButton(_ sender: UIButton) {
        self.textDocumentProxy.insertText("w")
    }
    @IBAction func eButton(_ sender: UIButton) {
        self.textDocumentProxy.insertText("e")
    }
    @IBAction func rButton(_ sender: UIButton) {
        self.textDocumentProxy.insertText("r")
    }
    @IBAction func tButton(_ sender: UIButton) {
        self.textDocumentProxy.insertText("t")
    }
    @IBAction func yButton(_ sender: UIButton) {
        self.textDocumentProxy.insertText("y")
    }
    @IBAction func uButton(_ sender: UIButton) {
        self.textDocumentProxy.insertText("u")
    }
    @IBAction func iButton(_ sender: UIButton) {
        self.textDocumentProxy.insertText("i")
    }
    @IBAction func oButton(_ sender: UIButton) {
        self.textDocumentProxy.insertText("o")
    }
    @IBAction func pButton(_ sender: UIButton) {
        self.textDocumentProxy.insertText("p")
    }
    @IBAction func aButton(_ sender: UIButton) {
        self.textDocumentProxy.insertText("a")
    }
    @IBAction func sButton(_ sender: UIButton) {
        self.textDocumentProxy.insertText("s")
    }
    @IBAction func dButton(_ sender: UIButton) {
        self.textDocumentProxy.insertText("d")
    }
    @IBAction func fButton(_ sender: UIButton) {
        self.textDocumentProxy.insertText("f")
    }
    @IBAction func gButton(_ sender: UIButton) {
        self.textDocumentProxy.insertText("g")
    }
    @IBAction func hButton(_ sender: UIButton) {
        self.textDocumentProxy.insertText("h")
    }
    @IBAction func jButton(_ sender: UIButton) {
        self.textDocumentProxy.insertText("j")
    }
    @IBAction func kButton(_ sender: UIButton) {
        self.textDocumentProxy.insertText("k")
    }
    @IBAction func lButton(_ sender: UIButton) {
        self.textDocumentProxy.insertText("l")
    }
    @IBAction func zButton(_ sender: UIButton) {
        self.textDocumentProxy.insertText("z")
    }
    @IBAction func xButton(_ sender: UIButton) {
        self.textDocumentProxy.insertText("x")
    }
    @IBAction func cButton(_ sender: UIButton) {
        self.textDocumentProxy.insertText("c")
    }
    @IBAction func vButton(_ sender: UIButton) {
        self.textDocumentProxy.insertText("v")
    }
    @IBAction func bButton(_ sender: UIButton) {
        self.textDocumentProxy.insertText("b")
        
    }
    @IBAction func nButton(_ sender: UIButton) {
        self.textDocumentProxy.insertText("n")
    }
    @IBAction func mButton(_ sender: UIButton) {
        self.textDocumentProxy.insertText("m")
    }
    @IBAction func spaceButton(_ sender: UIButton) {
        self.textDocumentProxy.insertText(" ")
        
    }
    @IBAction func delButton(_ sender: UIButton) {
        viewHuruf.isHidden = true
        viewAngka.isHidden = false
        
        self.textDocumentProxy.deleteBackward()
    }
    @IBAction func returnButton(_ sender: UIButton) {
        self.textDocumentProxy.insertText("\n")
    }
    
    
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewAngka.isHidden = true
        print("SUKSESS")
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .system)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        self.view.addSubview(self.nextKeyboardButton)
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    
    override func viewWillLayoutSubviews() {
        print("SUKSESS")
        self.nextKeyboardButton.isHidden = !self.needsInputModeSwitchKey
        super.viewWillLayoutSubviews()
//        let frameSize = self.view.frame.size
//      self.mainView.frame = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
    }
    
    var fullText: String = ""
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.

        let proxy = self.textDocumentProxy
        let precedingText = proxy.documentContextBeforeInput ?? ""
        let followingText = proxy.documentContextAfterInput ?? ""
        let selectedText = proxy.selectedText ?? ""
        fullText = "\(precedingText)\(selectedText)\(followingText)"
        
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        let textBefore = proxy.documentContextBeforeInput ?? "nil18236491824before"
        let textAfter = proxy.documentContextAfterInput ?? "nil18236491824after"
        
        if ((textBefore == "nil18236491824before") && (textAfter == "nil18236491824after"))  {
            print(fullText)
            if let parentViewController = self.parent {
                let hostBundleID = parentViewController.value(forKey: "_hostBundleID")
                print(hostBundleID ?? "default value")
            }
        }
        
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }

}
