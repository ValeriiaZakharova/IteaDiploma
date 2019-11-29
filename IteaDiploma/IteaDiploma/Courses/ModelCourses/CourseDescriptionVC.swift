//
//  CourseDescriptionVC.swift
//  IteaDiploma
//
//  Created by Valeriia Zakharova on 24.11.2019.
//  Copyright © 2019 valeriikaaa. All rights reserved.
//

import UIKit

class CourseDescriptionVC: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var aboutCourseLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var afterCourseLabel: UILabel!
    @IBOutlet weak var skillsLabel: UILabel!
    
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var goOnCourseButton: UIButton!
    @IBOutlet weak var aboutCourseView: UIView!
    @IBOutlet weak var skillsView: UIView!
    @IBOutlet weak var coverImage: UIImageView!
    
    
    var courseItem: CourseItem!
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
        updateUI()
    }
    @IBAction func didTapGoBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTapMore(_ sender: Any) {
        let storyboardCourses = UIStoryboard(name: "Courses", bundle: nil)
        let vc = storyboardCourses.instantiateViewController(identifier: "CourseInfoVC") as! CourseInfoVC
        vc.courseItem = courseItem
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func didTapGoOnCourse(_ sender: Any) {
        let storyboardCourses = UIStoryboard(name: "Courses", bundle: nil)
        let vc = storyboardCourses.instantiateViewController(identifier: "CourceApplyVC") as! CourceApplyVC
        vc.user = user
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension CourseDescriptionVC {
    
    func update(){
        
        titleLabel.text = courseItem.title
        aboutCourseLabel.text = "About course: "
        descriptionLabel.text = courseItem.description
        afterCourseLabel.text = "After course you can: "
        skillsLabel.text = courseItem.skills
    }
    
    func updateUI() {
        coverImage.image = UIImage(named: "itea")
        
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        titleLabel.backgroundColor = .white
        titleLabel.layer.cornerRadius = 10
        titleLabel.clipsToBounds = true
        
        aboutCourseLabel.textAlignment = .left
        aboutCourseLabel.textColor = .white
        
        descriptionLabel.textAlignment = .left
        descriptionLabel.textColor = .white
        
        aboutCourseView.layer.borderColor = UIColor.white.cgColor
        aboutCourseView.layer.borderWidth = 2
        aboutCourseView.clipsToBounds = true
        aboutCourseView.layer.masksToBounds = false
        aboutCourseView.layer.shadowColor = UIColor.black.cgColor
        aboutCourseView.layer.shadowRadius = 15
        aboutCourseView.layer.cornerRadius = 15.0
        aboutCourseView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        aboutCourseView.layer.shadowOpacity = 1
        
        afterCourseLabel.textAlignment = .left
        afterCourseLabel.textColor = .white
        
        skillsLabel.textAlignment = .left
        skillsLabel.textColor = .white
        
        skillsView.layer.borderColor = UIColor.white.cgColor
        skillsView.layer.borderWidth = 1
        skillsView.clipsToBounds = true
        skillsView.layer.masksToBounds = false
        skillsView.layer.shadowColor = UIColor.black.cgColor
        skillsView.layer.shadowRadius = 15
        skillsView.layer.cornerRadius = 15.0
        skillsView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        skillsView.layer.shadowOpacity = 1
        
        moreButton.backgroundColor = .white
        moreButton.titleLabel?.textAlignment = .center
        moreButton.titleLabel?.textColor = .black
        moreButton.layer.cornerRadius = 12
        moreButton.clipsToBounds = true
        
        goOnCourseButton.backgroundColor = .white
        goOnCourseButton.titleLabel?.textAlignment = .center
        goOnCourseButton.layer.cornerRadius = 12
        goOnCourseButton.clipsToBounds = true
        
    }
}
