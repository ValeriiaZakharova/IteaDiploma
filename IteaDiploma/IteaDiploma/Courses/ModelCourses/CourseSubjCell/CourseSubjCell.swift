//
//  CourseSubjCell.swift
//  IteaDiploma
//
//  Created by Valeriia Zakharova on 24.11.2019.
//  Copyright © 2019 valeriikaaa. All rights reserved.
//

import UIKit

class CourseSubjCell: UICollectionViewCell {
    
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var courseNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        contentView.clipsToBounds = true
    }
    
    //make cell round 
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        contentView.layer.cornerRadius = contentView.bounds.height / 2
//    }
    
}

extension CourseSubjCell {
    
    func updateCell(data: CourseSubject) {
        
        if let name = data.title {
            courseNameLabel.text = name
        }
        if let image = data.image {
            coverImage.image = image
        }
    }
    
    func updateCellContent() {
        
        courseNameLabel.textAlignment = .center
        courseNameLabel.textColor = .black
        courseNameLabel.backgroundColor = .white
        courseNameLabel.clipsToBounds = true
        courseNameLabel.layer.cornerRadius = 10
        courseNameLabel.layer.masksToBounds = false
        courseNameLabel.layer.shadowColor = UIColor.black.cgColor
        courseNameLabel.layer.shadowRadius = 15
        courseNameLabel.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        courseNameLabel.layer.shadowOpacity = 0.8
        courseNameLabel.numberOfLines = 0
        
    }
}
