//
//  providerVC.swift
//  Exhibition
//
//  Created by Farido on 5/26/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class providerVC: UIViewController {

    @IBOutlet weak var name: shadowTextFiled!
    @IBOutlet weak var email: shadowTextFiled!
    @IBOutlet weak var phome: shadowTextFiled!
    @IBOutlet weak var type: shadowTextFiled!
    @IBOutlet weak var meassage: shadowTextFiled!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    @IBAction func submitBTN(_ sender: Any) {
        
        guard let names = name.text, !names.isEmpty else {
            let messages = NSLocalizedString("enter your Name", comment: "hhhh")
            let title = NSLocalizedString("Register", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let phones = phome.text, !phones.isEmpty else {
            let messages = NSLocalizedString("enter your phone", comment: "hhhh")
            let title = NSLocalizedString("Register", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let types = type.text, !types.isEmpty else {
            let messages = NSLocalizedString("enter your type", comment: "hhhh")
            let title = NSLocalizedString("Register", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let meassages = meassage.text, !meassages.isEmpty else {
            let messages = NSLocalizedString("enter your meassage", comment: "hhhh")
            let title = NSLocalizedString("Register", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard isValidEmail(testStr: email.text ?? "") == true else {
            let messages = NSLocalizedString("email not correct", comment: "hhhh")
            let title = NSLocalizedString("Register Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        
        
        API_Register.servicesProvider(name: name.text ?? "", email: email.text ?? "", phone: phome.text ?? "", message: meassage.text ?? "", reason: type.text ?? ""){ (erroe: Error?, Success,status ,title,QRcode,phone,errors)  in
            if Success {
                if status == true {
                    self.showAlert(title: "Registration", message: title ?? "")
                }else {
                    self.showAlert(title: "Registration", message: title ?? "")
                }
                
                self.showAlert(title: "Registration", message: "congratulations  ! Registerd Successfuly")
            }else{
            }
        }
    }
    
    
}
