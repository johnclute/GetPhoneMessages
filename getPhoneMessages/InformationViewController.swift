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
    
    @IBAction func btnBack(_ sender: Any) {
        /*
           Found an interesting thing, if you have the button connected through the story board back to the calling view, it reloads everything, including viewdidload, however, if you dismiss it, then only viewdidappear runs.
         That is why i'm dismissing this viewController, each time did it before, if the automatice selector was selected, it would try to make a call each time.  That was driving me crazy.
        */
        self.dismiss(animated: true, completion: nil)
    }
    
    func showAlert(_ msg: String ) {
        
        let alertController = UIAlertController(title: "CC 3.0 Attribution", message: msg, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }

    
    @IBAction func btnDisplayAppIconCC3(_ sender: Any) {
        let msg = "https://www.freepik.com/free-vector/yellow-phone-icon_810130.htm Designed by Kreativkolors"
        showAlert(msg)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let helpMsg = UserDefaults.standard.string(forKey: "helpText") {
            instrTextView.text = helpMsg
        }
        // Do any additional setup after loading the view.
    }
    


}
