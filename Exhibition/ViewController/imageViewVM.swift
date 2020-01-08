//
//  imageViewVM.swift
//  Exhibition
//
//  Created by Farido on 1/8/20.
//  Copyright © 2020 Farido. All rights reserved.
//

import UIKit

class imageViewVM: UIViewController {

    @IBOutlet weak var logo: UIImageView!
    
    var imageUrl = ""
    var singleItme: servicesExhibitors?
    var singleItem2: productExhibitors?
        
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.2588235294, green: 0.4039215686, blue: 0.6980392157, alpha: 1)
        setUpNavColore(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpNavColore(false)
    }
    
    func setUpNavColore(_ isTranslucent: Bool){
           self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
           self.navigationController?.navigationBar.shadowImage = UIImage()
           self.navigationController?.navigationBar.isTranslucent = isTranslucent
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logo.image = UIImage(named: "3")
        let s = URLs.mainImage + (singleItme?.img ?? "") + (singleItem2?.img ?? "")
        print("ddddd\(s)")
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        logo.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            logo.kf.setImage(with: url)
        }
    }

}
