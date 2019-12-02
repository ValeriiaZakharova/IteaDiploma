//
//  SignUpVC.swift
//  IteaDiploma
//
//  Created by Valeriia Zakharova on 20.11.2019.
//  Copyright © 2019 valeriikaaa. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
    ///OUtlets
    @IBOutlet weak var enterNameLabel: UILabel!
    @IBOutlet weak var enterSecondNameLabel: UILabel!
    @IBOutlet weak var enterAgeLabel: UILabel!
    @IBOutlet weak var enterEmailLabel: UILabel!
    @IBOutlet weak var enterPhoneLabel: UILabel!
    @IBOutlet weak var enterPasswordLabel: UILabel!
    @IBOutlet weak var ConfirmPasswordLabel: UILabel!
    @IBOutlet weak var agreeToThePrivacyLabel: UILabel!
    
    @IBOutlet weak var errorNameLabel: UILabel!
    @IBOutlet weak var errorSecondNLabel: UILabel!
    @IBOutlet weak var errorAgeLabel: UILabel!
    @IBOutlet weak var errorEmailLabel: UILabel!
    @IBOutlet weak var errorPhoneLabel: UILabel!
    @IBOutlet weak var errorPasswordLabel: UILabel!
    @IBOutlet weak var errorConfirmPassword: UILabel!
    @IBOutlet weak var errorAgreeToPrivacyLabel: UILabel!
    
    @IBOutlet weak var errorNameConst: NSLayoutConstraint!
    @IBOutlet weak var errorSecondNConst: NSLayoutConstraint!
    @IBOutlet weak var errorAgeConst: NSLayoutConstraint!
    @IBOutlet weak var errorEmailConst: NSLayoutConstraint!
    @IBOutlet weak var errorPhoneConst: NSLayoutConstraint!
    @IBOutlet weak var errorPasswordConst: NSLayoutConstraint!
    @IBOutlet weak var errorConfirmPassConst: NSLayoutConstraint!
    @IBOutlet weak var errorAgreeToPrivacy: NSLayoutConstraint!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var secondNameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var secondNameView: UIView!
    @IBOutlet weak var ageView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var phoneView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var confirmPasswordView: UIView!
    @IBOutlet weak var agreeView: UIView!
    
    @IBOutlet weak var iteaImage: UIImageView!
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet weak var buttomScrollViewConst: NSLayoutConstraint!
    
    @IBOutlet weak var backToSingIn: UIButton!
    @IBOutlet weak var agreeToPrivacyButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    ///Variables
    var users: [User] = []
    var agreeToPrivacy = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        users = (navigationController?.viewControllers.first as! SignInVc).users
        
        nameTextField.delegate = self
        secondNameTextField.delegate = self
        ageTextField.delegate = self
        emailTextField.delegate = self
        phoneTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        
        updateUI()
        
        
        let keyBoardHide = UITapGestureRecognizer(target: self, action: #selector(keyboardWillHide))
               view.addGestureRecognizer(keyBoardHide)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        nameTextField.text = ""
        secondNameTextField.text = ""
        ageTextField.text = ""
        phoneTextField.text = ""
        emailTextField.text = ""
        passwordTextField.text = ""
        confirmPasswordTextField.text = ""
        
    }
    
    @IBAction func didTapSignUp(_ sender: Any) {
      
        let isNameValid = validateName(textField: nameTextField)
        let isSecondNameValid = validateSecondName(textField: secondNameTextField)
        let isAgeValid = validateAge(textField: ageTextField)
        let isEmailValid = validateEmail(textField: emailTextField)
        let isPhoneNumderValid = validatePhoneNumber(textField: phoneTextField)
        let isPasswordValid = validatePassword(textField: passwordTextField)
        let isConfirmPasswValid = validateConfirmPassword(textField1: passwordTextField, textField2: confirmPasswordTextField)
        let isEmailExist = validateIsEmailExist(users: users, textField: emailTextField)
        let isAgreeToPrivacyValid = validateAgreeToPrivacy()
        
        if isNameValid, isSecondNameValid, isAgeValid, isEmailValid, isPasswordValid, isPhoneNumderValid, isConfirmPasswValid, isEmailExist, isAgreeToPrivacyValid {
            
            let user = User()
            user.name = nameTextField.text
            user.surName = secondNameTextField.text
            user.age = ageTextField.text
            user.email = emailTextField.text
            user.password = passwordTextField.text
            user.phone = phoneTextField.text
            
            (navigationController?.viewControllers.first as! SignInVc).users.append(user)
            navigationController?.popViewController(animated: true)
            
        } else {
            print("Error: Can't go to another controller")
        }
    }
    
    @IBAction func didTapGoBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension SignUpVC {
    @objc func keyboardWillHide() {
        self.view.endEditing(true)
    }
}

/// Validate TextFields

extension SignUpVC {
    
    func validateName(textField: UITextField) -> Bool {
//        nameView.setNeedsLayout()
        if let name = textField.text, name.count > 2, name.count < 10 {
            errorNameConst.priority = UILayoutPriority(rawValue: 700)
            errorNameLabel.text = "Sorry, name should be more than two letters"
            return true
        } else {
            errorNameLabel.text = "Sorry, name should be more than two letters"
            errorNameConst.priority = UILayoutPriority(rawValue: 900)
            return false
        }
    }
    
    func validateSecondName(textField: UITextField) -> Bool {
        if let secondName = textField.text, secondName.count > 2, secondName.count < 10 {
            errorSecondNConst.priority = UILayoutPriority(rawValue: 700)
            return true
        } else {
            errorSecondNLabel.text = "Sorry, name should be more than two letters"
            errorSecondNConst.priority = UILayoutPriority(rawValue: 900)
            return false
        }
    }
    
    func validateAge(textField: UITextField) -> Bool {
        if let ageText = textField.text, let age = Int(ageText),
            age >= 18, age < 100 {
            errorAgeConst.priority = UILayoutPriority(rawValue: 700)
            return true
        } else {
            errorAgeLabel.text = "Sorry, to sing up you should be 18 "
            errorAgeConst.priority = UILayoutPriority(rawValue: 900)
            return false
        }
    }
    
    func validateEmail(textField: UITextField) -> Bool {
        if let email = textField.text, email.contains("@") {
            errorEmailConst.priority = UILayoutPriority(rawValue: 700)
            return true
        } else {
            errorEmailLabel.text = "Sorry, email adress should contains @"
            errorEmailConst.priority = UILayoutPriority(rawValue: 900)
            return false
        }
    }
    
    func validatePhoneNumber(textField: UITextField) -> Bool {
        if let phoneText = textField.text, phoneText.contains("+") {
            errorPhoneConst.priority = UILayoutPriority(rawValue: 700)
            return true
        } else {
            errorPhoneLabel.text = "Sorry, phone number should contains + "
            errorPhoneConst.priority = UILayoutPriority(rawValue: 900)
            return false
        }
    }
    
    func validatePassword(textField: UITextField) -> Bool {
        if let password = textField.text, password.count > 6, password.count < 12 {
            errorPasswordConst.priority = UILayoutPriority(rawValue: 700)
            return true
        } else {
            errorPasswordLabel.text = "Sorry, password should be more than 6 symbols"
            errorPasswordConst.priority = UILayoutPriority(rawValue: 900)
            return false
        }
    }
    
    func validateConfirmPassword(textField1: UITextField, textField2: UITextField) -> Bool {
        
        if let password = textField1.text, let confirmPassword = textField2.text, password == confirmPassword {
            errorConfirmPassConst.priority = UILayoutPriority(rawValue: 700)
            return true
        } else {
            errorConfirmPassword.text = "Sorry, passwords don't match"
            errorConfirmPassConst.priority = UILayoutPriority(rawValue: 900)
            return false
        }
    }
    
    func validateIsEmailExist(users: [User], textField: UITextField) -> Bool {
        for user in users {
            if let text = textField.text{
                print(" \(text) is not nil")
                if user.email == text {
                    print("email has already exist")
                    errorEmailLabel.text = "Sorry, this email adress has already exist, please Sign in"
                    errorEmailConst.priority = UILayoutPriority(rawValue: 900)
                    return false
                } else {
                    print("you can use this email")
                    errorEmailConst.priority = UILayoutPriority(rawValue: 700)
                    return true
                }
            } else {
                print("text is nil")
            }
        }
        print("will be return true")
        return true
    }
    
    func validateAgreeToPrivacy() -> Bool {
        if agreeToPrivacy == true {
            
            return true
        } else {
            errorAgreeToPrivacy.priority = UILayoutPriority(rawValue: 900)
            errorAgreeToPrivacyLabel.text = "Sorry, you should agree to Privacy Policy"
            return false
        }
    }
    
    @IBAction func didTapAgreeToPrivacy(_ sender: Any) {
        if agreeToPrivacy == false {
            agreeToPrivacyButton.setImage(UIImage(named: "check"), for: .normal)
            agreeToPrivacy = true
        } else {
            agreeToPrivacyButton.setImage(UIImage(named: ""), for: .normal)
            agreeToPrivacy = false
        }
    }
}

extension SignUpVC {
    
    func updateUI() {
        backgroundImage.image = UIImage(named: "itea")
        iteaImage.image = UIImage(named: "panda1")
        
        //buttons
        signUpButton.backgroundColor = .white
        signUpButton.setTitle("SING UP", for: .normal)
        signUpButton.layer.cornerRadius = 10
        signUpButton.clipsToBounds = true
        
        agreeToPrivacyButton.layer.borderColor = UIColor.black.cgColor
        agreeToPrivacyButton.layer.borderWidth = 1.5
        agreeToPrivacyButton.clipsToBounds = true
        
        backToSingIn.backgroundColor = .white
        backToSingIn.setTitle("SING IN", for: .normal)
        backToSingIn.layer.cornerRadius = 10
        backToSingIn.clipsToBounds = true
        
        //view1
        nameView.layer.cornerRadius = 15
        nameView.clipsToBounds = true
        nameView.clipsToBounds = true
        nameView.layer.masksToBounds = false
        nameView.layer.shadowColor = UIColor.black.cgColor
        nameView.layer.shadowRadius = 15
        nameView.layer.cornerRadius = 15.0
        nameView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        nameView.layer.shadowOpacity = 0.8
        
        //view2
        secondNameView.layer.cornerRadius = 15
        secondNameView.clipsToBounds = true
        secondNameView.clipsToBounds = true
        secondNameView.layer.masksToBounds = false
        secondNameView.layer.shadowColor = UIColor.black.cgColor
        secondNameView.layer.shadowRadius = 15
        secondNameView.layer.cornerRadius = 15.0
        secondNameView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        secondNameView.layer.shadowOpacity = 0.8
        
        //view3
        ageView.layer.cornerRadius = 15
        ageView.clipsToBounds = true
        ageView.clipsToBounds = true
        ageView.layer.masksToBounds = false
        ageView.layer.shadowColor = UIColor.black.cgColor
        ageView.layer.shadowRadius = 15
        ageView.layer.cornerRadius = 15.0
        ageView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        ageView.layer.shadowOpacity = 0.8
        
        //view4
        emailView.layer.cornerRadius = 15
        emailView.clipsToBounds = true
        emailView.clipsToBounds = true
        emailView.layer.masksToBounds = false
        emailView.layer.shadowColor = UIColor.black.cgColor
        emailView.layer.shadowRadius = 15
        emailView.layer.cornerRadius = 15.0
        emailView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        emailView.layer.shadowOpacity = 0.8
        
        //view5
        phoneView.layer.cornerRadius = 15
        phoneView.clipsToBounds = true
        phoneView.clipsToBounds = true
        phoneView.layer.masksToBounds = false
        phoneView.layer.shadowColor = UIColor.black.cgColor
        phoneView.layer.shadowRadius = 15
        phoneView.layer.cornerRadius = 15.0
        phoneView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        phoneView.layer.shadowOpacity = 0.8
        
        //view6
        passwordView.layer.cornerRadius = 15
        passwordView.clipsToBounds = true
        passwordView.clipsToBounds = true
        passwordView.layer.masksToBounds = false
        passwordView.layer.shadowColor = UIColor.black.cgColor
        passwordView.layer.shadowRadius = 15
        passwordView.layer.cornerRadius = 15.0
        passwordView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        passwordView.layer.shadowOpacity = 0.8
        
        //view7
        confirmPasswordView.layer.cornerRadius = 15
        confirmPasswordView.clipsToBounds = true
        confirmPasswordView.clipsToBounds = true
        confirmPasswordView.layer.masksToBounds = false
        confirmPasswordView.layer.shadowColor = UIColor.black.cgColor
        confirmPasswordView.layer.shadowRadius = 15
        confirmPasswordView.layer.cornerRadius = 15.0
        confirmPasswordView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        confirmPasswordView.layer.shadowOpacity = 0.8
        
        //view8
        agreeView.layer.cornerRadius = 15
        agreeView.clipsToBounds = true
        agreeView.clipsToBounds = true
        agreeView.layer.masksToBounds = false
        agreeView.layer.shadowColor = UIColor.black.cgColor
        agreeView.layer.shadowRadius = 15
        agreeView.layer.cornerRadius = 15.0
        agreeView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        agreeView.layer.shadowOpacity = 0.8
        
        errorNameLabel.textColor = .red
        errorNameLabel.font = .systemFont(ofSize: 14)
        errorSecondNLabel.textColor = .red
        errorSecondNLabel.font = .systemFont(ofSize: 14)
        errorAgeLabel.textColor = .red
        errorAgeLabel.font = .systemFont(ofSize: 14)
        errorEmailLabel.textColor = .red
        errorEmailLabel.font = .systemFont(ofSize: 14)
        errorPhoneLabel.textColor = .red
        errorPhoneLabel.font = .systemFont(ofSize: 14)
        errorPasswordLabel.textColor = .red
        errorPasswordLabel.font = .systemFont(ofSize: 14)
        errorConfirmPassword.textColor = .red
        errorConfirmPassword.font = .systemFont(ofSize: 14)
        errorAgreeToPrivacyLabel.textColor = .red
        errorAgreeToPrivacyLabel.font = .systemFont(ofSize: 14)

    }
}

extension SignUpVC: UITextFieldDelegate  {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
          buttomScrollViewConst.constant = 300
      }
      
      func textFieldDidEndEditing(_ textField: UITextField) {
          buttomScrollViewConst.constant = 0
      }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameTextField:
            secondNameTextField.becomeFirstResponder()
        case secondNameTextField:
            ageTextField.becomeFirstResponder()
        case ageTextField:
            emailTextField.becomeFirstResponder()
        case emailTextField:
            phoneTextField.becomeFirstResponder()
        case phoneTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            confirmPasswordTextField.becomeFirstResponder()
        case confirmPasswordTextField:
            self.view.endEditing(true)
        default:
            fatalError()
        }
        return true
    }
    
    
    // ПЕРЕДЕЛАТЬ СКОНСТРЙНЫ
    
    
    
}



