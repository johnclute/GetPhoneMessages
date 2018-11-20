//
//  InformationViewController.swift
//  getPhoneMessages
//
//  Created by John Clute on 11/14/18.
//  Copyright © 2018 creativeApps. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController {


    @IBOutlet weak var instrTextView: UITextView!
    
    func showAlert(_ msg: String ) {
        
        let alertController = UIAlertController(title: "CC 3.0 Attribution", message: msg, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }

    @IBAction func btnDisplayInfoCC3(_ sender: Any) {
        
        let msg = "http://www.freepik.com from https://www.flaticon.com/ www.flaticon.com is licensed by  http://creativecommons.org/licenses/by/3.0/ Creative Commons BY 3.0"
        showAlert(msg)
    }

    @IBAction func btnDisplayDeleteCC3(_ sender: Any) {
        let msg = "http://www.freepik.com from https://www.flaticon.com/ www.flaticon.com is licensed by  http://creativecommons.org/licenses/by/3.0/ Creative Commons BY 3.0"
        showAlert(msg)

    }
    
    @IBAction func btnDisplayAppIconCC3(_ sender: Any) {
        let msg = "https://www.freepik.com/free-vector/yellow-phone-icon_810130.htm Designed by Kreativkolors"
        showAlert(msg)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}
