//
//  ViewController.swift
//  getPhoneMessages
//
//  Created by John Clute on 10/30/18.
//  Copyright © 2018 creativeApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    
    var buttonClass = [buttonHelper]()
    var selectedButton = 0
    var firstime = 0
    
    @IBOutlet weak var txtMessageNumber: UITextField!
    
    @IBOutlet weak var txtMessageCode: UITextField!
    
    @IBOutlet weak var btnGetMessage: UIButton!
    
    @IBOutlet weak var lblDisplayStatus: UILabel!
    @IBOutlet weak var btnHome: UIButton!
    @IBOutlet weak var btnSecond: UIButton!
    @IBOutlet weak var btnAux: UIButton!
    @IBOutlet weak var lblHomeMsg: UILabel!
    @IBOutlet weak var lblSecondMsg: UILabel!
    @IBOutlet weak var lblAuxMgs: UILabel!
    @IBOutlet weak var btnClearOutlet: UIButton!
    @IBOutlet weak var swtchCallWhenStarted: UISwitch!
    @IBOutlet weak var btnDeleteMsgs: UIButton!
    @IBOutlet weak var btnInfoTxtFields: UIButton!
    @IBOutlet weak var btnAppInfo: UIButton!
    
    func resizeScreenObjects(_ screenWidth: CGFloat, _ screenHeight: CGFloat ) {
        print("X = \(screenWidth) Y = \(screenHeight)")
        print("Label Field Height = \(CGFloat(CGFloat(statusRatio) * screenHeight))")
        print("Label Origin Height = \(lblDisplayStatus.frame.height)")
        
        lblDisplayStatus.frame = CGRect(x: lblDisplayStatus.frame.origin.x, y: lblDisplayStatus.frame.origin.y, width: lblDisplayStatus.frame.width, height: (CGFloat(statusRatio) * screenHeight))
    }
    
    

    @IBAction func btnClearText(_ sender: Any) {
        txtMessageCode.text = ""
        txtMessageNumber.text = ""
        buttonClass[selectedButton].setSelected(selected: false)
        let lblMsg = buttonClass[selectedButton].labelMessage()
        if (selectedButton == 0) {
            lblHomeMsg.text = lblMsg
        } else if ( selectedButton == 1 ) {
            lblSecondMsg.text = lblMsg
        } else {
            lblAuxMgs.text = lblMsg
        }
    }
    
    @IBAction func swtchMovedStartAction(_ sender: Any) {
        UserDefaults.standard.set(swtchCallWhenStarted.isOn, forKey: "CallWhenStarted")
    }
    
    @IBAction func btnAppInfo(_ sender: Any) {
        
    }
    
    @IBAction func btnCodeInfo(_ sender: Any) {
    }
    
    @IBAction func btnDeleteCallNumber(_ sender: Any) {
        eraseDefaults( buttonClass[selectedButton])
        txtMessageNumber.text = ""
        txtMessageCode.text = ""
        let imageName: UIImage = UIImage(named: "btnEmpty-3.png")!
        buttonClass[selectedButton].setSelected(selected: false)
        switch selectedButton {
        case 0:
            btnHome.setImage(imageName, for: UIControl.State.normal)
            lblHomeMsg.text = buttonClass[selectedButton].labelMessage()
            swtchCallWhenStarted.setOn(false, animated: true)
            UserDefaults.standard.set(false, forKey: "CallWhenStarted")
            
            break
        case 1:
            btnSecond.setImage(imageName, for: UIControl.State.normal)
            lblSecondMsg.text = buttonClass[selectedButton].labelMessage()

            break
        case 2:
            btnAux.setImage(imageName, for: UIControl.State.normal)
            lblAuxMgs.text = buttonClass[selectedButton].labelMessage()

            break
        default:
            print("Error, bad button number")
        }
        buttonClass[selectedButton].eraseData()
    }
    
    @IBAction func btnHomeMsg(_ sender: Any) {
        selectedButton = 0
        getDefaults( buttonClass[selectedButton])
        let cnt : Bool = buttonClass[selectedButton].doesContain()
        if (cnt){
            buttonClass[0].setSelected(selected: true)
            buttonClass[1].setSelected(selected: false)
            buttonClass[2].setSelected(selected: false)
            getNumbers()
        } else {
            loadButtonClass()
        }
    }
    
    @IBAction func btnSecondMsg(_ sender: Any) {
        selectedButton = 1
        getDefaults( buttonClass[selectedButton])

        let cnt : Bool = buttonClass[selectedButton].doesContain()
        if (cnt){
            buttonClass[0].setSelected(selected: false)
            buttonClass[1].setSelected(selected: true)
            buttonClass[2].setSelected(selected: false)
            getNumbers()
        } else {
            loadButtonClass()
        }
    }
    
    @IBAction func btnMisc(_ sender: Any) {
        selectedButton = 2
        getDefaults(buttonClass[selectedButton])

        let cnt : Bool = buttonClass[selectedButton].doesContain()
        if (cnt){
            buttonClass[0].setSelected(selected: false)
            buttonClass[1].setSelected(selected: false)
            buttonClass[2].setSelected(selected: true)
            getNumbers()
        } else {
            loadButtonClass()
        }

    }
    
    func loadButtonClass () {
        var arr = [String]()
        var btnImg = UIImage()
        
        arr = getStoredNumbers()
        if( arr[0] != "" && arr[1] != "") {
            buttonClass[selectedButton].setMessageNum(num: arr[0])
            buttonClass[selectedButton].setMessageCode(code: arr[1])
            buttonClass[selectedButton].setContains(inpt: true)
            if ( selectedButton >= 0 && selectedButton < 3) {
                setDefault( buttonClass[selectedButton])
            }
            switch selectedButton {
            case 0:
                btnImg = UIImage(named: "btnMsg1-3.png")!
                btnHome.setImage(btnImg, for: UIControl.State.normal)
                break
            case 1:
                btnImg = UIImage(named: "btnMsg2-3.png")!
                btnSecond.setImage(btnImg, for: UIControl.State.normal)
                break
            case 2:
                btnImg = UIImage(named: "btnAux.png")!
                btnAux.setImage(btnImg, for: UIControl.State.normal)
                break
            default:
                print ("Error: No buttons selected")
            }
        }

    }
    
    func getStoredNumbers() -> [String] {
        var phoneNumber: String = ""
        var messCode: String = ""
        
        if let ar1 = UserDefaults.standard.string(forKey: "MessagePhoneNumber") {
            if ( ar1 != txtMessageNumber.text) {
                phoneNumber = txtMessageNumber.text!
            } else {
                phoneNumber = ar1
            }
        }
        
        if let ar2 = UserDefaults.standard.string(forKey: "MessageCode") {
            if ( ar2  != txtMessageCode.text ) {
                messCode = txtMessageCode.text!
            } else {
                messCode = ar2
            }
        }
        
        let rtArr = [phoneNumber, messCode]
        return rtArr
    }
    
    func getNumbers() {
        txtMessageNumber.text = buttonClass[selectedButton].getMessageNum()
        txtMessageCode.text = buttonClass[selectedButton].getMessageCode()
        lblHomeMsg.text = buttonClass[0].labelMessage()
        lblSecondMsg.text = buttonClass[1].labelMessage()
        lblAuxMgs.text = buttonClass[2].labelMessage()
    }
    
    override func viewDidLoad() {
        firstime += 1
        
        let screenSize = UIScreen.main.bounds
        super.viewDidLoad()
        createKeyPadDoneKey()
        selectedButton = 0
        
        
        let turnedOn = UserDefaults.standard.bool(forKey: "CallWhenStarted")
        swtchCallWhenStarted.setOn(turnedOn, animated: false)

        for i in 0...2 {
            buttonClass.append(buttonHelper.init(btnNum: i))
            getDefaults( buttonClass[i])
            var btnImg = UIImage()
            switch i  {
            case 0 : do {
                if buttonClass[0].doesContain() {
                    btnImg = UIImage(named: "btnMsg1-3.png")!
                } else {
                    btnImg = UIImage(named: "btnEmpty-3.png")!
                }
                btnHome.setImage(btnImg, for: UIControl.State.normal)

                break
                }
            case 1 : do {
                if buttonClass[1].doesContain() {
                    btnImg = UIImage(named: "btnMsg2-3.png")!
                } else {
                    btnImg = UIImage(named: "btnEmpty-3.png")!
                }
                btnSecond.setImage(btnImg, for: UIControl.State.normal)
            
                break
                }
            case 2: do {
                if buttonClass[2].doesContain() {
                    btnImg = UIImage(named: "btnAux.png")!
                } else {
                    btnImg = UIImage(named: "btnEmpty-3.png")!
                }
               
                btnAux.setImage(btnImg, for: UIControl.State.normal)
                break
                }
            default:
                selectedButton  = 0
            }
        }
        if buttonClass[0].doesContain() {
            selectedButton = 0
            txtMessageNumber.text = buttonClass[0].getMessageNum()
            txtMessageCode.text = buttonClass[0].getMessageCode()
            UserDefaults.standard.set(txtMessageNumber.text, forKey: "MessagePhoneNumber")
            UserDefaults.standard.set(txtMessageCode.text, forKey: "MessageCode")
            buttonClass[selectedButton].setSelected(selected: true)
            lblHomeMsg.text = buttonClass[selectedButton].labelMessage()
        }
        
        resizeScreenObjects(screenSize.width, screenSize.height)
        
        if swtchCallWhenStarted.isOn {
            print("First Time - \(firstime)")
            if firstime == 1 {
                self.getMessage(self)
            }
        }
    }
    

    @IBAction func finishedEditingNumber(_ sender: Any) {
        UserDefaults.standard.set(txtMessageNumber.text, forKey: "MessagePhoneNumber")
    }
    
    
    @IBAction func finishedEditingCode(_ sender: Any) {
        UserDefaults.standard.set(txtMessageCode.text, forKey: "MessageCode")
    }
    
    
    @IBAction func getMessage(_ sender: Any) {
        lblDisplayStatus.text = "Getting phone messages."
        var phoneNumber=""
        var messCode=""
        
        if let ar1 = UserDefaults.standard.string(forKey: "MessagePhoneNumber") {
            if ( ar1 != txtMessageNumber.text) {
                phoneNumber = txtMessageNumber.text!
            } else {
                phoneNumber = ar1
            }
        }
        
        if let ar2 = UserDefaults.standard.string(forKey: "MessageCode") {
            if ( ar2  != txtMessageCode.text ) {
                messCode = txtMessageCode.text!
            } else {
                messCode = ar2
            }
        }
        
        lblDisplayStatus.text = "Dialing: \(phoneNumber) "
        let outNumber = "tel://\(phoneNumber),\(messCode)"
        
        if let url = URL(string: outNumber) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(clearDialStatus), userInfo: nil, repeats: false)
        print ("\(phoneNumber),\(messCode)\n")
        
    }
    
    @objc func clearDialStatus () {
        lblDisplayStatus.text = ""
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
        txtMessageNumber.inputAccessoryView = toolBar
        txtMessageCode.inputAccessoryView = toolBar
        
        
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

