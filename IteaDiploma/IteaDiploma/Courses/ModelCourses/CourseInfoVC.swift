//
//  CourseInfoVC.swift
//  IteaDiploma
//
//  Created by Valeriia Zakharova on 24.11.2019.
//  Copyright © 2019 valeriikaaa. All rights reserved.
//

import UIKit

class CourseInfoVC: UIViewController {
    
    @IBOutlet weak var moreLabel: UILabel!
    @IBOutlet weak var moreView: UIView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var coverImage: UIImageView!
    
    var courseItem: CourseItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
        updateUI()
    }
    @IBAction func didTapGoBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension CourseInfoVC {
    
    func update() {
        moreLabel.text = "Learn more about course"
        infoLabel.text = courseItem.informatiion
    }
    
    func updateUI() {
        infoLabel.textAlignment = .left
        infoLabel.numberOfLines = 0
        moreView.layer.borderColor = UIColor.white.cgColor
        moreView.layer.borderWidth = 2
        moreView.clipsToBounds = true
        moreView.layer.masksToBounds = false
        moreView.layer.shadowColor = UIColor.black.cgColor
        moreView.layer.shadowRadius = 15
        moreView.layer.cornerRadius = 15.0
        moreView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        moreView.layer.shadowOpacity = 1
        
        coverImage.image = UIImage(named: "itea")
        
        moreLabel.textColor = .white
        infoLabel.textColor = .white
    }
}
