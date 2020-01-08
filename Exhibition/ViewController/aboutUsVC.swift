//
//  aboutUsVC.swift
//  Exhibition
//
//  Created by Farido on 5/28/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class aboutUsVC: UIViewController {
    
    @IBOutlet weak var ditalsTV: UITextView!
    
    var dataDes = ""
    var id = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if id == ""{
            getData()
        }else {
            self.ditalsTV.text = dataDes
        }
    }
    
    func getData(){
        
        API_Menue.aboutUs{ (erroe: Error?, Success,status ,title,QRcode,phone,errors)  in
            if Success {
                if status == true {
                   self.ditalsTV.text = title
                }else {
                    
                }
            }else{
            }
        }
    }
}
