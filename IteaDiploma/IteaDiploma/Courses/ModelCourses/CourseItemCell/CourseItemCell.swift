//
//  CourseItemCell.swift
//  IteaDiploma
//
//  Created by Valeriia Zakharova on 25.11.2019.
//  Copyright © 2019 valeriikaaa. All rights reserved.
//

import UIKit

class CourseItemCell: UITableViewCell {
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
}

extension CourseItemCell {
    
    func updateCell(data: CourseItem) {
        if let name = data.title {
            itemNameLabel.text = name
        }
        if let image = data.image {
            itemImage.image = image
        }
    }
    
    func updateCellUI() {
        
        itemNameLabel.backgroundColor = .white
        itemNameLabel.textAlignment = .center
        itemNameLabel.numberOfLines = 0
        itemNameLabel.textColor = .black
        itemNameLabel.layer.masksToBounds = false
        itemNameLabel.layer.shadowColor = UIColor.black.cgColor
        itemNameLabel.layer.shadowRadius = 15
        itemNameLabel.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        itemNameLabel.layer.shadowOpacity = 0.8
    }
}
