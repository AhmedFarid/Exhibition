//
//  jopSDetilesVC.swift
//  Exhibition
//
//  Created by Farido on 6/12/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class jopSDetilesVC: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var des: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phone: UILabel!
    
    var singleItem: jops?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUPdetials()
        
    }

    func setUPdetials(){
        des.text = singleItem?.descriptio
        email.text = singleItem?.email
        phone.text =  singleItem?.date
        image.image = UIImage(named: "3")
        let s = ("\(URLs.mainImage)\(singleItem?.img ?? "")")
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        
        image.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            image.kf.setImage(with: url)
        }
        
    }
}

