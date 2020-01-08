//
//  visitorsRegisterVC.swift
//  Exhibition
//
//  Created by Farido on 5/26/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class visitorsRegisterVC: UIViewController {

    @IBOutlet weak var name: shadowTextFiled!
    @IBOutlet weak var email: shadowTextFiled!
    @IBOutlet weak var phone: shadowTextFiled!
    
    
    var id = 0
    var photo = ""
    var phoned = ""
    var names = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavagtion()
        
    }
    
    func setupNavagtion(){
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
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
        
        guard isValidEmail(testStr: email.text ?? "") == true else {
            let messages = NSLocalizedString("email not correct", comment: "hhhh")
            let title = NSLocalizedString("Register Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }

        
        
        API_Register.registerVistor(name: name.text ?? "", email: email.text ?? "", phone: phone.text ?? "", fairs_id: id){ (erroe: Error?, Success,status ,title,QRcode,phone,errors)  in
            if Success {
                if status == true {
                    self.phoned = phone ?? ""
                    self.photo = QRcode ?? ""
                    self.names = title ?? ""
                    self.performSegue(withIdentifier: "suge", sender: nil)
                }else {
            
                }
            }else{
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destaiantion = segue.destination as? qrRaderVC{
            destaiantion.images = photo
            destaiantion.phones = phoned
            destaiantion.titles = names
        }else if let destaiantion = segue.destination as? underConstrFairDetailsVC{
            if let sub = sender as? underconstructionFair{
                destaiantion.singleItem = sub
            }
        }
    }
}
