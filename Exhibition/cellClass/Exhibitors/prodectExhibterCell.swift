//
//  prodectExhibterCell.swift
//  Exhibition
//
//  Created by Farido on 5/30/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class prodectExhibterCell: UICollectionViewCell {

    
    override func awakeFromNib() {
        self.layer.cornerRadius = 5.0
        self.layer.borderWidth = 2.0
        self.layer.borderColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
    }
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    
    
    func configuerCell(item:productExhibitors) {
        self.title.text = item.title
        self.price.text = "\(item.price) SAR"
        
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
