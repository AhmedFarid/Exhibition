//
//  hoallNumberCell.swift
//  Exhibition
//
//  Created by Farido on 5/23/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class hoallNumberCell: UITableViewCell {
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 5.0
        self.layer.borderWidth = 2.0
        self.layer.borderColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
    }
    
    
    @IBOutlet weak var title: UILabel!
    
    
    func configuerCell(item: holeExhibitorNo) {
        self.title.text = item.title
    }
}
