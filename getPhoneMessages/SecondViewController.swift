//
//  SecondViewController.swift
//  getPhoneMessages
//
//  Created by John Clute on 11/28/18.
//  Copyright © 2018 creativeApps. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    let helpText = "Second Screen\n Create a Command\n Sometimes you need to do more then just go into voicemail, this screen allows you to enter more complicated commands, such as deleting several unwanted voicemails, or enter commands to go into a conference call.\n\n Button - Back\n Returns to Main Screen\n\n Text Field - Password entry\n Enter access code to voicemail account\n\n Text Field - Navigation Keys\n Telephone key number to navigate to different menus of the voicemail, Ie in Verizon 1 goes to saved messages.\n\n Switch - Welcome Message Delay\n When turned on, this causes a delay of 6 seconds allowing the welcome message to play indicating what options are available and is ready to accept key entry\n\n Text Field - Delay between messages\n Indicates the number of seconds the user wants to wait before performing an action.  For example if you want to delete a message a 4 second delay is needed to allow the delete message play before you can delete another message.\n\n Text Field - Action sequence\n This is the action the user wants to perform, such as delete a messages. Verizon used 7 for deleting saved messages.\n\n Text Field - Repeat how many times\n This is the number of times you want to repeat an action(s). Lets say you want to delete 77 voicemails, you would enter 77. If you want to display 1 action command enter 1 in the Repeat field, 0 - will not display the action sequences.\n\n Button - Cancel\n Delete all entries and go back to main screen\n\n Button - Accept\n Save all entries and place this information in the Password field.\n\n Button - Information\n Display Brief information about this screen."
    
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
    
    @IBAction func btnShowHelp(_ sender: Any) {
        /*
         Show help about this screen, instead of manually linking screen,
         going to present and display text related to this screen.
         */
        let msgHelp = helpText
        UserDefaults.standard.set(msgHelp, forKey: "helpText")
        let next = storyboard?.instantiateViewController(withIdentifier: "infoWindow") as! InformationViewController
        self.present(next, animated: true, completion: nil)
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
