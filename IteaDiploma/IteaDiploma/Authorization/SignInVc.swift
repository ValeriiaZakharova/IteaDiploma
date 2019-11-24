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
    @IBOutlet weak var errorUserNameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var errorPasswordLabel: UILabel!
    @IBOutlet weak var coverImage: UIImageView!
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var bottomConstScrollView: NSLayoutConstraint!
    @IBOutlet weak var signIn: UIButton!
    @IBOutlet weak var signUp: UIButton!
    
    @IBOutlet weak var errorNameConst: NSLayoutConstraint!
    @IBOutlet weak var errorPasswordConst: NSLayoutConstraint!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        updateView()
        let keyBoardHide = UITapGestureRecognizer(target: self, action: #selector(keyboardWillHide))
        view.addGestureRecognizer(keyBoardHide)
    }
    
    @IBAction func didTapSignIn(_ sender: Any) {
        
        
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
            
            // make validation
            
            // if not valid
            
            let alert = UIAlertController(title: "Fields invalid", message: "Please check your email or password", preferredStyle: .alert)
            
            let close = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(close)
            self.present(alert, animated: true, completion: nil)
            
        default:
            fatalError()
        }
        return true
    }
    
}

extension SignInVc {
    
    func updateView() {
        coverImage.image = UIImage(named: "itea")
        signIn.backgroundColor = .brown
        signIn.titleLabel?.text = "SIGN IN"
        signIn.titleLabel?.textColor = .red
    }
    
    
}
