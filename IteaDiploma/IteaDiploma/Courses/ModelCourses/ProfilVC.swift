//
//  ProfilVC.swift
//  IteaDiploma
//
//  Created by Valeriia Zakharova on 24.11.2019.
//  Copyright © 2019 valeriikaaa. All rights reserved.
//

import UIKit

class ProfilVC: UIViewController {
    
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var lastCoursesButton: UIButton!
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var userSecondNameTF: UITextField!
    @IBOutlet weak var useAgeTF: UITextField!
    @IBOutlet weak var userCityTF: UITextField!
    @IBOutlet weak var userBirthdayTF: UITextField!
    @IBOutlet weak var userEmailTF: UITextField!
    @IBOutlet weak var userPhoneTF: UITextField!
    @IBOutlet weak var userCurrentCoursesTF: UITextField!
    @IBOutlet weak var userWorkTF: UITextField!
    
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var currentCoursLabel: UILabel!
    @IBOutlet weak var workLabel: UILabel!
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    
    @IBOutlet weak var bottomConstScrollView: NSLayoutConstraint!
    var editMode = false
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //textfield delegate
        userNameTF.delegate = self
        userSecondNameTF.delegate = self
        useAgeTF.delegate = self
        userCityTF.delegate = self
        userBirthdayTF.delegate = self
        userEmailTF.delegate = self
        userPhoneTF.delegate = self
        userCurrentCoursesTF.delegate = self
        userWorkTF.delegate = self
        
        // defult value for TextFieads - thea are not enabled
        userNameTF.isEnabled = editMode
        userSecondNameTF.isEnabled = editMode
        useAgeTF.isEnabled = editMode
        userCityTF.isEnabled = editMode
        userBirthdayTF.isEnabled = editMode
        userEmailTF.isEnabled = editMode
        userPhoneTF.isEnabled = editMode
        userCurrentCoursesTF.isEnabled = editMode
        userWorkTF.isEnabled = editMode
        
        let keyBoardHide = UITapGestureRecognizer(target: self, action: #selector(keyboardWillHide))
        view.addGestureRecognizer(keyBoardHide)
        
        updateUI()
        updateLabel()
    }
    
    @IBAction func didTapGoBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTapGoEditProfile(_ sender: Any) {
        
        if editButton.isSelected == false {
            editButton.setTitle("Safe", for: .normal)
            userNameTF.isEnabled = !editMode
            userSecondNameTF.isEnabled = !editMode
            useAgeTF.isEnabled = !editMode
            userCityTF.isEnabled = !editMode
            userBirthdayTF.isEnabled = !editMode
            userPhoneTF.isEnabled = !editMode
            userWorkTF.isEnabled = !editMode
            editButton.isSelected = true
        } else {
            editButton.setTitle("Edit", for: .normal)
            userNameTF.isEnabled = editMode
            userSecondNameTF.isEnabled = editMode
            useAgeTF.isEnabled = editMode
            userCityTF.isEnabled = editMode
            userBirthdayTF.isEnabled = editMode
            userPhoneTF.isEnabled = editMode
            userWorkTF.isEnabled = editMode
            editButton.isSelected = false
            
        }
    }
    
    @IBAction func didTapgoToLastCourses(_ sender: Any) {
        let storyboardCourses = UIStoryboard(name: "Courses", bundle: nil)
        let vc = storyboardCourses.instantiateViewController(identifier: "UserCoursesVC") as! UserCoursesVC
        vc.user = user
        navigationController?.pushViewController(vc, animated: true)
    }
}
extension ProfilVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        bottomConstScrollView.constant = 300
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        bottomConstScrollView.constant = 0
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case userNameTF:
            userSecondNameTF.becomeFirstResponder()
        case userSecondNameTF:
            useAgeTF.becomeFirstResponder()
        case useAgeTF:
            userCityTF.becomeFirstResponder()
        case userCityTF:
            userBirthdayTF.becomeFirstResponder()
        case userBirthdayTF:
            userPhoneTF.becomeFirstResponder()
        case userPhoneTF:
            userWorkTF.becomeFirstResponder()
        case userWorkTF:
            self.view.endEditing(true)
        default:
            fatalError()
        }
        return true
    }
}

extension ProfilVC {
    @objc func keyboardWillHide() {
        self.view.endEditing(true)
    }
}

extension ProfilVC {
    func updateLabel() {
        userImageView.image = user.photo
        userNameTF.text = user.name
        userSecondNameTF.text = user.surName
        useAgeTF.text = user.age
        userCityTF.text = user.city
        userWorkTF.text = user.work
        userBirthdayTF.text = user.birthday
        userEmailTF.text = user.email
        userPhoneTF.text = user.phone
        userCurrentCoursesTF.text = user.currentCourse?.title
    }
    
    func updateUI() {
        
        coverImage.image = UIImage(named: "itea")
        editButton.backgroundColor = .white
        editButton.layer.cornerRadius = 12
        editButton.clipsToBounds = true
        
        lastCoursesButton.backgroundColor = .white
        lastCoursesButton.layer.cornerRadius = 12
        lastCoursesButton.clipsToBounds = true
        
        userImageView.layer.cornerRadius = userImageView.frame.width / 2
        userImageView.layer.borderColor = UIColor.black.cgColor
        userImageView.layer.borderWidth = 1
        userImageView.clipsToBounds = true
        
        firstView.layer.cornerRadius = 15
        firstView.clipsToBounds = true
        firstView.layer.masksToBounds = false
        firstView.layer.shadowColor = UIColor.black.cgColor
        firstView.layer.shadowRadius = 15
        firstView.layer.cornerRadius = 15.0
        firstView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        firstView.layer.shadowOpacity = 0.8
        
        secondView.layer.cornerRadius = 15
        secondView.clipsToBounds = true
        secondView.layer.masksToBounds = false
        secondView.layer.shadowColor = UIColor.black.cgColor
        secondView.layer.shadowRadius = 15
        secondView.layer.cornerRadius = 15.0
        secondView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        secondView.layer.shadowOpacity = 0.8
    }
}
