//
//  qrRaderVC.swift
//  Exhibition
//
//  Created by Farido on 5/26/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class qrRaderVC: UIViewController {

    @IBOutlet weak var titless: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    var titles = ""
    var phones = ""
    var images = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavagtion()
        setUPdetials()
        
    }
    
    func setupNavagtion(){
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
    }
    
    func setUPdetials(){
        print(titles)
        titless.text = titles
        self.phone.text = phones
        image.image = UIImage(named: "3")
        let s = ("\(URLs.mainImage)\(images)")
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        
        image.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            image.kf.setImage(with: url)
        }
        
    }
}
