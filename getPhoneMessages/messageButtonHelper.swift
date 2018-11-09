//
//  messageButtonHelper.swift
//  getPhoneMessages
//
//  Created by John Clute on 11/2/18.
//  Copyright © 2018 creativeApps. All rights reserved.
//

import Foundation
class buttonHelper {
    
    private var contains: Bool = false
    private let arrSelectedBtnlblMsg = ["Home Msg. Selected", "Second Msg. Selected", "Misc. Selected"]
    
    private let arrBtnLblMsg = [ "Home Msg.", "Second Msg.", "Misc."]
    
    private let arrBtnType = ["home","second","aux"]

    private var buttonNum: Int = -1
    private var selectedBtn: Bool = false
    private var messageNum: String = ""
    private var messageCode: String = ""
    
    func eraseData () {
        selectedBtn = false
        messageNum = ""
        messageCode = ""
        contains = false
    }
    
    func getButtonType () -> String {
        var rc: String = "Empty"
        if ( buttonNum >= 0 ) {
            rc = arrBtnType[buttonNum]
        }
        return rc
    }
    
    init( btnNum: Int ) {
        buttonNum = btnNum
    }
    
    func setContains( inpt: Bool) {
        contains = inpt
    }
    
    func doesContain () -> Bool {
        return contains
    }

    func setButtonNum ( btnNum: Int ) {
        buttonNum = btnNum
    }
    
    func setSelected ( selected: Bool ) {
        selectedBtn = selected
    }
    
    func setMessageNum ( num: String) {
        messageNum = num
    }
    
    func setMessageCode ( code : String ) {
        messageCode = code
    }
    
    func isSelected () -> Bool {
        return selectedBtn
    }
    
    func getMessageNum () -> String {
        return messageNum
    }
    
    func getMessageCode () -> String {
        return messageCode
    }
    
    func labelMessage() -> String {
        if selectedBtn {
            return arrSelectedBtnlblMsg[buttonNum]
        } else {
            return arrBtnLblMsg[buttonNum]
        }
    }
    
    
}
