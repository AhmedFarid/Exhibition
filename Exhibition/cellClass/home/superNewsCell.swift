//
//  superNewsCell.swift
//  Exhibition
//
//  Created by Farido on 5/22/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class superNewsCell: UICollectionViewCell {
    
    
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    
    func configuerCell(item: superNews) {
        self.title.text = item.title
        self.desc.text = item.descripti
    }
    
}
