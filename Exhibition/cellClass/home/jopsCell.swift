//
//  jopsCell.swift
//  Exhibition
//
//  Created by Farido on 5/22/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class jopsCell: UICollectionViewCell {
    
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 5.0
        self.layer.borderWidth = 2.0
        self.layer.borderColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
    }
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var des: UILabel!
    @IBOutlet weak var mail: UILabel!
    @IBOutlet weak var date: UILabel!
    
    func configuerCell(item: jops) {
        self.title.text = item.title
        self.des.text = item.descriptio
        self.mail.text = item.email
        self.date.text = item.date
        
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
