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

    override func awakeFromNib() {
        super.awakeFromNib()
      
    }
}

extension UserCoursesVC {
    
    func updateCell(data: User) {
        
        //courseCoverImageView.image = data.currentCourse?.image
        
    }
    
    
}
