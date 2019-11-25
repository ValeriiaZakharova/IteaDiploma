//
//  ProfilVC.swift
//  IteaDiploma
//
//  Created by Valeriia Zakharova on 24.11.2019.
//  Copyright © 2019 valeriikaaa. All rights reserved.
//

import UIKit

class ProfilVC: UIViewController {
    
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var lastCoursesButton: UIButton!
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var usreSecondNameLabel: UILabel!
    @IBOutlet weak var useAgeLabel: UILabel!
    @IBOutlet weak var userCityLabel: UILabel!
    @IBOutlet weak var userBirthdayLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var userPhoneLabel: UILabel!
    @IBOutlet weak var userCurrentCoursesLabel: UILabel!
    @IBOutlet weak var userWorkLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var currentCoursLabel: UILabel!
    @IBOutlet weak var workLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user = Storage().makeUsers()
        updateUI()
        updateLabel()
    }
    
    @IBAction func didTapGoBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTapGoEditProfile(_ sender: Any) {
        let storyboardCourses = UIStoryboard(name: "Courses", bundle: nil)
        let vc = storyboardCourses.instantiateViewController(identifier: "EditProfileVC") as! EditProfileVC
        vc.user = user
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func didTapgoToLastCourses(_ sender: Any) {
        let storyboardCourses = UIStoryboard(name: "Courses", bundle: nil)
        let vc = storyboardCourses.instantiateViewController(identifier: "UserCoursesVC") as! UserCoursesVC
        vc.user = user
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ProfilVC {
    func updateLabel() {
        userImageView.image = user.photo
        userNameLabel.text = user.name
        usreSecondNameLabel.text = user.surName
        useAgeLabel.text = user.age
        userCityLabel.text = user.city
        userWorkLabel.text = user.work
        userBirthdayLabel.text = user.birthday
        userEmailLabel.text = user.email
        userPhoneLabel.text = user.phone
        userCurrentCoursesLabel.text = user.currentCourse?.title
    }
    
    func updateUI() {
        editButton.backgroundColor = .red
        editButton.layer.cornerRadius = 12
        editButton.clipsToBounds = true
        
        lastCoursesButton.backgroundColor = .red
        lastCoursesButton.layer.cornerRadius = 12
        lastCoursesButton.clipsToBounds = true
        
        userImageView.layer.cornerRadius = userImageView.frame.width / 2
        userImageView.clipsToBounds = true
        
        ageLabel.backgroundColor = .red
        ageLabel.textAlignment = .center
        ageLabel.layer.cornerRadius = 12
        ageLabel.clipsToBounds = true
        
        cityLabel.backgroundColor = .red
        cityLabel.textAlignment = .center
        cityLabel.layer.cornerRadius = 12
        cityLabel.clipsToBounds = true
        
        birthdayLabel.backgroundColor = .red
        birthdayLabel.textAlignment = .center
        birthdayLabel.layer.cornerRadius = 12
        birthdayLabel.clipsToBounds = true
        
        emailLabel.backgroundColor = .red
        emailLabel.textAlignment = .center
        emailLabel.layer.cornerRadius = 12
        emailLabel.clipsToBounds = true
        
        phoneLabel.backgroundColor = .red
        phoneLabel.textAlignment = .center
        phoneLabel.layer.cornerRadius = 12
        phoneLabel.clipsToBounds = true
        
        currentCoursLabel.backgroundColor = .red
        currentCoursLabel.textAlignment = .center
        currentCoursLabel.layer.cornerRadius = 12
        currentCoursLabel.clipsToBounds = true
        
        workLabel.backgroundColor = .red
        workLabel.textAlignment = .center
        workLabel.layer.cornerRadius = 12
        workLabel.clipsToBounds = true
    }
}
