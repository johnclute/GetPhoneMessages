//
//  utilities.swift
//  getPhoneMessages
//
//  Created by John Clute on 11/6/18.
//  Copyright © 2018 creativeApps. All rights reserved.
//

import Foundation

let viewCalcWidth = 375.0
let viewCalcHeight = 667.0
let statusRatio = 30.0/viewCalcHeight
let textFieldRatioHeight = Float(30.0/viewCalcHeight)
let switchRatioWidth = 47.0/viewCalcWidth
let switchRatioHeight = 31.0/viewCalcHeight
let infoBtnRatioWidth = 33.0/viewCalcWidth
let infoBtnRatioHeight = 33.0/viewCalcHeight
let deleteRatioWidth = 44.0/viewCalcWidth
let deleteRatioHeight = 44.0/viewCalcHeight
let clearRationWidth = 54.0/viewCalcWidth
let clearRatioHeight = 40.0/viewCalcHeight
let btnMsgRatioWidth = 95.0/viewCalcWidth
let btnMsgRatioHeight = 48.0/viewCalcHeight
let lblMsgRatioHeight = 56.0/viewCalcHeight
let headerRatioWidth = 140.0/viewCalcWidth
let headerRatioHeight = 31.0/viewCalcHeight

func setDefault(_ btnType: buttonHelper  ) {
    let valName1 = "\(btnType.getButtonType())Msg"
    let valName2 = "\(btnType.getButtonType())Code"
    UserDefaults.standard.set(btnType.getMessageNum(), forKey: valName1)
    UserDefaults.standard.set(btnType.getMessageCode(), forKey: valName2)
    btnType.setContains(inpt: true)
}

func getDefaults(_ btnType: buttonHelper) {
    btnType.setContains(inpt: false)
    let valName1 = "\(btnType.getButtonType())Msg"
    let valName2 = "\(btnType.getButtonType())Code"
    if let tmp1 = UserDefaults.standard.string(forKey: valName1) {
        btnType.setContains(inpt: true)
        btnType.setMessageNum(num: tmp1)
    }
    if let tmp2 = UserDefaults.standard.string(forKey: valName2) {
        btnType.setContains(inpt: true)
        btnType.setMessageCode(code: tmp2)
    }
}

func eraseDefaults(_ btnType: buttonHelper) {
    let valName1 = "\(btnType.getButtonType())Msg"
    let valName2 = "\(btnType.getButtonType())Code"
    UserDefaults.standard.removeObject(forKey: valName1)
    UserDefaults.standard.removeObject(forKey: valName2)
    
}
