//
//  SignInVc.swift
//  IteaDiploma
//
//  Created by Valeriia Zakharova on 20.11.2019.
//  Copyright © 2019 valeriikaaa. All rights reserved.
//

import UIKit

class SignInVc: UIViewController {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var imageItea: UIImageView!
    
    @IBOutlet weak var firstBlockView: UIView!
    @IBOutlet weak var secondBlockView: UIView!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var bottomConstScrollView: NSLayoutConstraint!
    @IBOutlet weak var signIn: UIButton!
    @IBOutlet weak var signUp: UIButton!
    
    var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        users = Storage().makeUsers()
        
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        updateView()
        let keyBoardHide = UITapGestureRecognizer(target: self, action: #selector(keyboardWillHide))
        view.addGestureRecognizer(keyBoardHide)
    }
    
    @IBAction func didTapSignIn(_ sender: Any) {
        var authorizedUser: User? = nil
        for user in users {
            if userNameTextField.text == user.email, passwordTextField.text == user.password {
                authorizedUser = user
                break
            }
        }
        
        if let user = authorizedUser {
            let storyboardCourses = UIStoryboard(name: "Courses", bundle: nil)
            let vc = storyboardCourses.instantiateViewController(identifier: "CoursSubjectVC") as! CoursSubjectVC
            //vc.users = users
            navigationController?.pushViewController(vc, animated: true)
        } else {
            let alert = UIAlertController(title: "Sorry, something went wrong", message: "Please check your email or password", preferredStyle: .alert)
            let close = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(close)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    @IBAction func didTapSignUp(_ sender: Any) {
    
        let storyboardAuth = UIStoryboard(name: "Auth", bundle: nil)
        let vc = storyboardAuth.instantiateViewController(identifier: "SignUpVC") as! SignUpVC
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension SignInVc {
    @objc func keyboardWillHide() {
        self.view.endEditing(true)
    }
}

extension SignInVc: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        bottomConstScrollView.constant = 260
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        bottomConstScrollView.constant = 0
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case userNameTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            self.view.endEditing(true)
        default:
            fatalError()
        }
        return true
    }
}

extension SignInVc {
    func updateView() {
        //images
        coverImage.image = UIImage(named: "itea")
        imageItea.image = UIImage(named: "panda")
        
        //buttons
        signIn.backgroundColor = .white
        signIn.setTitle("SING IN", for: .normal)
        signIn.layer.cornerRadius = 10
        signIn.clipsToBounds = true
        
        signUp.backgroundColor = .white
        signUp.setTitle("SING UP", for: .normal)
        signUp.layer.cornerRadius = 10
        signUp.clipsToBounds = true
        
        //view1
        firstBlockView.layer.cornerRadius = 15
        firstBlockView.clipsToBounds = true
        firstBlockView.layer.masksToBounds = false
        firstBlockView.layer.shadowColor = UIColor.black.cgColor
        firstBlockView.layer.shadowRadius = 15
        firstBlockView.layer.cornerRadius = 15.0
        firstBlockView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        firstBlockView.layer.shadowOpacity = 0.8
        
        //view2
        secondBlockView.layer.cornerRadius = 15
        secondBlockView.clipsToBounds = true
        secondBlockView.layer.masksToBounds = false
        secondBlockView.layer.shadowColor = UIColor.black.cgColor
        secondBlockView.layer.shadowRadius = 15
        secondBlockView.layer.cornerRadius = 15.0
        secondBlockView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        secondBlockView.layer.shadowOpacity = 0.8
    
    }
}
