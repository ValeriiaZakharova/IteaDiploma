//
//  SignUpVC.swift
//  IteaDiploma
//
//  Created by Valeriia Zakharova on 20.11.2019.
//  Copyright © 2019 valeriikaaa. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {

    @IBOutlet weak var enterNameLabel: UILabel!
    @IBOutlet weak var enterSecondNameLabel: UILabel!
    @IBOutlet weak var enterAgeLabel: UILabel!
    @IBOutlet weak var enterEmailLabel: UILabel!
    @IBOutlet weak var enterPhoneLabel: UILabel!
    @IBOutlet weak var entrrPasswordLabel: UILabel!
    @IBOutlet weak var ConfirmPasswordLabel: UILabel!
    @IBOutlet weak var agreeToThePrivacyLabel: UILabel!
    
    @IBOutlet weak var errorNameLabel: UILabel!
    @IBOutlet weak var errorSecondNLabel: UILabel!
    @IBOutlet weak var errorAgeLabel: UILabel!
    @IBOutlet weak var errorEmailLabel: UILabel!
    @IBOutlet weak var errorPhoneLabel: UILabel!
    @IBOutlet weak var errorPasswordLabel: UILabel!
    @IBOutlet weak var errorConfirmPassword: UILabel!
    
    @IBOutlet weak var errorNameConst: NSLayoutConstraint!
    @IBOutlet weak var errorSecondNConst: NSLayoutConstraint!
    @IBOutlet weak var errorAgeConst: NSLayoutConstraint!
    @IBOutlet weak var errorEmailConst: NSLayoutConstraint!
    @IBOutlet weak var errorPhoneConst: NSLayoutConstraint!
    @IBOutlet weak var errorPasswordConst: NSLayoutConstraint!
    @IBOutlet weak var errorConfirmPassConst: NSLayoutConstraint!
    
    @IBOutlet weak var buttomScrollViewConst: NSLayoutConstraint!
    
    @IBOutlet weak var agreeToPrivacyButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

   
    }
   
    @IBAction func didTapSignUp(_ sender: Any) {
        
        let storyboardAuth = UIStoryboard(name: "Courses", bundle: nil)
        let vc = storyboardAuth.instantiateViewController(identifier: "CoursSubjectVC") as! CoursSubjectVC
        navigationController?.pushViewController(vc, animated: true)
    }
    

}
