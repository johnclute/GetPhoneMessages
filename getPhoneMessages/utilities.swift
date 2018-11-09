//
//  utilities.swift
//  getPhoneMessages
//
//  Created by John Clute on 11/6/18.
//  Copyright © 2018 creativeApps. All rights reserved.
//

import Foundation

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
