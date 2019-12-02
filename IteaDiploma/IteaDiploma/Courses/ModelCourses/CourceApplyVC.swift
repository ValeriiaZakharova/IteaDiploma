//
//  CourceApplyVC.swift
//  IteaDiploma
//
//  Created by Valeriia Zakharova on 24.11.2019.
//  Copyright © 2019 valeriikaaa. All rights reserved.
//

import UIKit

class CourceApplyVC: UIViewController {
    
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var iteaImage: UIImageView!
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var forthView: UIView!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surNameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var commentsTextView: UITextView!
    
    @IBOutlet weak var errorNameLabel: UILabel!
    @IBOutlet weak var errorSurNameLabel: UILabel!
    @IBOutlet weak var errorPhoneLabel: UILabel!
    
    @IBOutlet weak var goOnCourseButton: UIButton!
    
    @IBOutlet weak var bottomConstScrollView: NSLayoutConstraint!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorNameLabel.isHidden = true
        errorPhoneLabel.isHidden = true
        errorSurNameLabel.isHidden = true
        updateLabel()
        updateUI()
        let keyBoardHide = UITapGestureRecognizer(target: self, action: #selector(keyboardWillHide))
        view.addGestureRecognizer(keyBoardHide)
        
    }
    
    @IBAction func didTapSendForm(_ sender: Any) {
        
        let isNameValid = validateName(textField: nameTextField)
        let isSurNameValid = validateSurName(textField: surNameTextField)
        let isSurNamePhoneNumber = validatePhoneNumber(textField: phoneTextField)
        
        
        if isNameValid, isSurNameValid, isSurNamePhoneNumber {
            if let navigationcontrollers = navigationController?.viewControllers {
                if let courseSubjectVc = navigationcontrollers[navigationcontrollers.count - 4] as? CoursSubjectVC {
                    navigationController?.popToViewController(courseSubjectVc, animated: true)
                }
            }
            
        }
    }
}

extension CourceApplyVC {
    
    func validateName(textField: UITextField) -> Bool {
        if let name = textField.text, name.count > 2, name.count < 10 {
            errorNameLabel.isHidden = true
            return true
        } else {
            errorNameLabel.isHidden = false
            errorNameLabel.text = "Sorry, name should be more than two letters"
            return false
        }
    }
    
    func validateSurName(textField: UITextField) -> Bool {
        if let secondName = textField.text, secondName.count > 2, secondName.count < 10 {
            errorSurNameLabel.isHidden = true
            return true
        } else {
            errorSurNameLabel.isHidden = false
            errorSurNameLabel.text = "Sorry, name should be more than two letters"
            return false
        }
    }
    func validatePhoneNumber(textField: UITextField) -> Bool {
        if let phoneText = textField.text, phoneText.contains("+") {
            errorPhoneLabel.isHidden = true
            return true
        } else {
            errorPhoneLabel.isHidden = false
            errorPhoneLabel.text = "Sorry, phone number should contains + "
            return false
        }
    }
}
extension CourceApplyVC {
    @objc func keyboardWillHide() {
        self.view.endEditing(true)
    }
}
extension CourceApplyVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        bottomConstScrollView.constant = 300
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        bottomConstScrollView.constant = 0
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameTextField:
            surNameTextField.becomeFirstResponder()
        case surNameTextField:
            phoneTextField.becomeFirstResponder()
        case phoneTextField:
            self.view.endEditing(true)
        default:
            fatalError()
        }
        return true
    }
}

extension CourceApplyVC {
    
    func updateLabel() {
        
        if let name = user.name {
            nameTextField.text = name
        }
        if let surName = user.surName {
            surNameTextField.text = surName
        }
        if let phone = user.phone {
            phoneTextField.text = phone
        }
    }
    
    func updateUI() {
        
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
        
        thirdView.layer.cornerRadius = 15
        thirdView.clipsToBounds = true
        thirdView.layer.masksToBounds = false
        thirdView.layer.shadowColor = UIColor.black.cgColor
        thirdView.layer.shadowRadius = 15
        thirdView.layer.cornerRadius = 15.0
        thirdView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        thirdView.layer.shadowOpacity = 0.8
        
        forthView.layer.cornerRadius = 15
        forthView.clipsToBounds = true
        forthView.layer.masksToBounds = false
        forthView.layer.shadowColor = UIColor.black.cgColor
        forthView.layer.shadowRadius = 15
        forthView.layer.cornerRadius = 15.0
        forthView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        forthView.layer.shadowOpacity = 0.8
        
        commentsTextView.layer.borderColor = UIColor.black.cgColor
        commentsTextView.layer.borderWidth = 0.8
        commentsTextView.clipsToBounds = true
        
        goOnCourseButton.setTitle("Go On Course!", for: .normal)
        goOnCourseButton.layer.cornerRadius = 12
        goOnCourseButton.clipsToBounds = true
        goOnCourseButton.backgroundColor = .white
        
        coverImage.image = UIImage(named: "itea")
        iteaImage.image = UIImage(named: "panda")
        
    }
}
