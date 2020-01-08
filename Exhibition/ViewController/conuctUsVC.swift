//
//  conuctUsVC.swift
//  Exhibition
//
//  Created by Farido on 5/28/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class conuctUsVC: UIViewController {

    
    @IBOutlet weak var nameTF: shadowTextFiled!
    @IBOutlet weak var email: shadowTextFiled!
    @IBOutlet weak var phone: shadowTextFiled!
    @IBOutlet weak var reason: shadowTextFiled!
    @IBOutlet weak var massage: shadowTextFiled!
    
    
    var resone = ["اضافة عرض","زيارة معرض","طلب عرض"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createBussPiker()
    }
    
    func createToolbar() {
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        //Customizations
        toolBar.barTintColor = .black
        toolBar.tintColor = .white
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(conuctUsVC.dismissKeyboard))
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        reason.inputAccessoryView = toolBar
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func createBussPiker(){
        let reson = UIPickerView()
        reson.delegate = self
        reson.dataSource = self
        reason.inputView = reson
        reson.reloadAllComponents()
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }

    
    
    @IBAction func sendBTN(_ sender: Any) {
        
        guard let names = nameTF.text, !names.isEmpty else {
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
        
        guard let types = reason.text, !types.isEmpty else {
            let messages = NSLocalizedString("enter your reason", comment: "hhhh")
            let title = NSLocalizedString("Register", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let meassages = massage.text, !meassages.isEmpty else {
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
        
        
        API_Menue.counectUs(name: nameTF.text ?? "", email: email.text ?? "", phone: phone.text ?? "", message: massage.text ?? "", reason: reason.text ?? ""){ (erroe: Error?, Success,status ,title,QRcode,phone,errors)  in
            if Success {
                if status == true {
                    print("xxxxxxx")
                    self.showAlert(title: "contact us", message: title ?? "")
                }else {
                    
                }
            }else{
            }
        }
    }
}


extension conuctUsVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return resone.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       return resone[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        reason.text = resone[row]
    }
}
