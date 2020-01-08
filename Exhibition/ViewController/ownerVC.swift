//
//  ownerVC.swift
//  Exhibition
//
//  Created by Farido on 5/26/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class ownerVC: UIViewController {

  
    @IBOutlet weak var name: shadowTextFiled!
    @IBOutlet weak var email: shadowTextFiled!
    @IBOutlet weak var phone: shadowTextFiled!
    @IBOutlet weak var dateFrom: shadowTextFiled!
    @IBOutlet weak var dateTo: shadowTextFiled!
    @IBOutlet weak var location: shadowTextFiled!
    @IBOutlet weak var message: shadowTextFiled!
    
    private var datePiker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createDateStart()
        createDateEnd()
    }
    
    func createDateStart(){
        
        datePiker = UIDatePicker()
        datePiker?.datePickerMode = .date
        datePiker?.addTarget(self, action: #selector(ownerVC.dateChanged(datePiker:)), for: .valueChanged)
        self.view.endEditing(false)
        dateFrom.inputView = datePiker
        
    }
    
    @objc func dateChanged(datePiker: UIDatePicker) {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd"
        dateFrom.text = dateFormater.string(from: datePiker.date)
        view.endEditing(true)
    }
    
    func createDateEnd(){
        
        datePiker = UIDatePicker()
        datePiker?.datePickerMode = .date
        datePiker?.addTarget(self, action: #selector(ownerVC.dateChangedend(datePiker:)), for: .valueChanged)
        self.view.endEditing(false)
        dateTo.inputView = datePiker
        
    }
    
    @objc func dateChangedend(datePiker: UIDatePicker) {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd"
        dateTo.text = dateFormater.string(from: datePiker.date)
        view.endEditing(true)
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    
    @IBAction func registerBTN(_ sender: Any) {
        
        
        guard let names = name.text, !names.isEmpty else {
            let messages = NSLocalizedString("enter your Name", comment: "hhhh")
            let title = NSLocalizedString("Register", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let phones = phone.text, !phones.isEmpty else {
            let messages = NSLocalizedString("enter your phone", comment: "hhhh")
            let title = NSLocalizedString("Register", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let dateFroms = dateFrom.text, !dateFroms.isEmpty else {
            let messages = NSLocalizedString("enter your date From", comment: "hhhh")
            let title = NSLocalizedString("Register", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        
        guard let dateTos = dateTo.text, !dateTos.isEmpty else {
            let messages = NSLocalizedString("enter your date To", comment: "hhhh")
            let title = NSLocalizedString("Register", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let locations = location.text, !locations.isEmpty else {
            let messages = NSLocalizedString("enter your location", comment: "hhhh")
            let title = NSLocalizedString("Register", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let messages = message.text, !messages.isEmpty else {
            let messages = NSLocalizedString("enter your message", comment: "hhhh")
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

        API_Register.OwnerFairRequest(name: name.text ?? "", email: email.text ?? "", phone: phone.text ?? "", date_from: dateFrom.text ?? "", date_to: dateTo.text ?? "", message: message.text ?? "", location: location.text ?? ""){ (erroe: Error?, Success,status ,title,QRcode,phone,errors)  in
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
