//
//  categouryProviderDetilasCell.swift
//  Exhibition
//
//  Created by Farido on 6/16/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class categouryProviderDetilasCell: UICollectionViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var des: UILabel!
    
    func configuerCell(item: categoryProviderDetails) {
        self.title.text = item.title
        self.des.text = item.descriptio
        
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
