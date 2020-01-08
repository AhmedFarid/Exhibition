//
//  categoryProviderDetialsVC.swift
//  Exhibition
//
//  Created by Farido on 6/13/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class categoryProviderDetialsVC: UIViewController {
    
    
    @IBOutlet weak var imag: UIImageView!
    @IBOutlet weak var DETIALESTF: UITextView!
    @IBOutlet weak var titleTF: UILabel!
    
    var singleItem: categoryProviderDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        
    }
    
    func getData() {
        self.titleTF.text = singleItem?.title
        self.DETIALESTF.text = singleItem?.descriptio
        
        
        self.imag.image = UIImage(named: "3")
        let s = ("\(URLs.mainImage)\(singleItem?.img ?? "")")
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        
        self.imag.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            self.imag.kf.setImage(with: url)
            
        }
        
    }
}
