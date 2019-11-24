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
       }
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
        courseNameLabel.backgroundColor = .red
        courseNameLabel.numberOfLines = 0
        
    }
}
