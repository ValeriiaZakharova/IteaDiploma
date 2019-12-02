//
//  UserCourseCell.swift
//  IteaDiploma
//
//  Created by Valeriia Zakharova on 25.11.2019.
//  Copyright © 2019 valeriikaaa. All rights reserved.
//

import UIKit

class UserCourseCell: UITableViewCell {
    
    @IBOutlet weak var courseCoverImageView: UIImageView!
    @IBOutlet weak var courseTitleLabel: UILabel!
    @IBOutlet weak var frameView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}

extension UserCourseCell {
    
    func updateCellUI() {
        
        courseTitleLabel.textAlignment = .center
        courseTitleLabel.textColor = .black
        courseTitleLabel.layer.cornerRadius = 12
        courseTitleLabel.clipsToBounds = true
        courseTitleLabel.layer.masksToBounds = false
        courseTitleLabel.layer.shadowColor = UIColor.black.cgColor
        courseTitleLabel.layer.shadowRadius = 15
        courseTitleLabel.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        courseTitleLabel.layer.shadowOpacity = 0.8
        courseTitleLabel.backgroundColor = .white
        
        frameView.layer.borderColor = UIColor.black.cgColor
        frameView.layer.borderWidth = 1.5
        frameView.clipsToBounds = true
        
    }
}
