//
//  newBanner.swift
//  Exhibition
//
//  Created by Farido on 7/10/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class newBanner: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    
    func configuerCell(item: superBanners) {
        
        let s = ("\(URLs.mainImage)\(item.img)")
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        
        image.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            image.kf.setImage(with: url)
            //imageView.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "3"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
    
}
