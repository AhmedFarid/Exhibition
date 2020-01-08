//
//  mapIllustrationCell.swift
//  Exhibition
//
//  Created by Farido on 6/16/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class mapIllustrationCell: UICollectionViewCell {
    
    @IBOutlet weak var img: UIImageView!
    
    
    
    func configuerCell(item: imgMapIllustration) {
        
        let s = ("\(URLs.mainImage)\(item.img)")
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        
        img.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            img.kf.setImage(with: url)
            //imageView.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "3"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
}
