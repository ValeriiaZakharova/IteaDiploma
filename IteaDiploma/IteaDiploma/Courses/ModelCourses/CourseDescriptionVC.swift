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
    
    var courseItem: CourseItem!
    
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
        let vc = storyboardCourses.instantiateViewController(identifier: "CourseApplyVC") as! CourceApplyVC
    
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
        titleLabel.textAlignment = .center
        titleLabel.backgroundColor = .red
        titleLabel.layer.cornerRadius = 12
        titleLabel.clipsToBounds = true
        
        aboutCourseLabel.textAlignment = .left
        
        descriptionLabel.textAlignment = .left
        aboutCourseView.layer.borderColor = UIColor.black.cgColor
        aboutCourseView.layer.borderWidth = 1
        
        afterCourseLabel.textAlignment = .left
        
        skillsLabel.textAlignment = .left
        skillsView.layer.borderColor = UIColor.black.cgColor
        skillsView.layer.borderWidth = 1
        
        moreButton.backgroundColor = .red
        moreButton.titleLabel?.text = "More"
        moreButton.titleLabel?.textAlignment = .center
        moreButton.titleLabel?.textColor = .black
        moreButton.layer.cornerRadius = 12
        moreButton.clipsToBounds = true
        
        goOnCourseButton.backgroundColor = .red
        goOnCourseButton.titleLabel?.text = "More"
        goOnCourseButton.titleLabel?.textAlignment = .center
        goOnCourseButton.titleLabel?.textColor = .black
        goOnCourseButton.layer.cornerRadius = 12
        goOnCourseButton.clipsToBounds = true
    }
}
