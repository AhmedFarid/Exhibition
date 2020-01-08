//
//  menuVC.swift
//  Exhibition
//
//  Created by Farido on 5/28/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import MOLH

class menuVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func langBTN(_ sender: Any) {
        
        MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() == "en" ? "ar" : "en")
        MOLH.reset(transition: .transitionCrossDissolve)
        
    }
}
