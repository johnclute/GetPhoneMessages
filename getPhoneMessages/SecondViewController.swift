//
//  SecondViewController.swift
//  getPhoneMessages
//
//  Created by John Clute on 11/28/18.
//  Copyright © 2018 creativeApps. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var txtAccessCode: UITextField!
    @IBOutlet weak var txtNavKeys: UITextField!
    @IBOutlet weak var txtSecDelay: UITextField!
    @IBOutlet weak var txtActions: UITextField!
    @IBOutlet weak var txtRepeat: UITextField!
    @IBOutlet weak var swtchWelcomeMsgDelay: UISwitch!
    @IBOutlet weak var lblStatusMessage: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        swtchWelcomeMsgDelay.setOn(false, animated: false)

        createKeyPadDoneKey()
    }
    
    
    @IBAction func btnBack(_ sender: Any) {
        UserDefaults.standard.set(nil, forKey: "newCode")
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func btnCancelCode(_ sender: Any) {
        UserDefaults.standard.set(nil, forKey: "newCode")
        self.dismiss(animated: true, completion: nil)

    }
    
    @IBAction func btnSaveCode(_ sender: Any) {
        var savedCode: String
        var msgCmd: String = ""
        var msgRepeated: Int = 0
        
        savedCode = ""
        var wlcmDelay = ""
        if let accessCode: String = txtAccessCode.text {
            
            if swtchWelcomeMsgDelay.isOn {
                wlcmDelay = ",,,"
            }

            if let navKeys: String = txtNavKeys.text {
                savedCode = accessCode + wlcmDelay + navKeys
            }
        }
        
        var actionsTaken: String = ""
        
        if let secDelay = txtSecDelay.text {
            if let tmp = Int(secDelay) {
                let delay = ((tmp/2)+(tmp%2))
                for _ in 0..<delay {
                    actionsTaken = actionsTaken + ","
                }
            }
        }
        if let actionSequence = txtActions.text {
            actionsTaken = actionsTaken + actionSequence
            msgCmd = actionSequence
        }
        if let tmp1 = Int(txtRepeat.text!) {
            msgRepeated = tmp1
            UserDefaults.standard.set(msgRepeated, forKey: "msgRepeated")
            UserDefaults.standard.set(msgCmd, forKey: "msgCmd")
            for _ in 0..<tmp1 {
                savedCode = savedCode + actionsTaken
            }
            
        }
        
        print("\(savedCode)")
        
        UserDefaults.standard.set(savedCode, forKey: "newCode")
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @objc func doneClicked() {
        view.endEditing(true)
        return
        
    }
    
    /// <#Description#>
    func createKeyPadDoneKey() {
        //create a toolbar above keyboard on iphone
        // need to set size to fit so that it will go all the way across the view
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        // Do any additional setup after loading the view, typically from a nib.
        // create donebutton, this is will close the keyboard  Also created an action doneClicked function
        // that performs endsEditing and closes the keyboard
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(doneClicked))
        // flexible space is used to push the done button to the right, I like the look of it.
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        // add buttons to toolbar
        toolBar.setItems([flexibleSpace,doneButton], animated: false)
        txtAccessCode.inputAccessoryView = toolBar
        txtNavKeys.inputAccessoryView = toolBar
        txtSecDelay.inputAccessoryView = toolBar
        txtActions.inputAccessoryView = toolBar
        txtRepeat.inputAccessoryView = toolBar
        
        
        // -------------
    }
    
    //When touching outside of text field close keyboard
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - touches: <#touches description#>
    ///   - event: <#event description#>
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    

}
