//
//  avlipaltiyPosationsCell.swift
//  Exhibition
//
//  Created by Farido on 5/26/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class avlipaltiyPosationsCell: UITableViewCell {

    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var size: UILabel!
    @IBOutlet weak var price: UILabel!
    
    func configuerCell(item: availablePartitions) {
        self.id.text = "\(item.id_partion)"
        let places = NSLocalizedString("Places", comment: "profuct list lang")
        self.number.text = "\(item.number) \(places))"
        self.size.text = "\(item.width)*\(item.height)"
        let sar = NSLocalizedString("SAR", comment: "profuct list lang")
        self.price.text = "\(item.price) \(sar)"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.accessoryType = selected ? .checkmark : .none
    }
    
    
}
