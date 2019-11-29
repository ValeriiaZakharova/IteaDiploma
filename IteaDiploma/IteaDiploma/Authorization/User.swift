//
//  User.swift
//  IteaDiploma
//
//  Created by Valeriia Zakharova on 22.11.2019.
//  Copyright © 2019 valeriikaaa. All rights reserved.
//

import Foundation
import UIKit

class User {
    
    var name: String?
    var surName: String?
    var userName: String?
    var password: String?
    var photo: UIImage?
    var age: String?
    var city: String?
    var birthday: String?
    var email: String?
    var phone: String?
    var currentCourse: CourseItem!
    var completedCourses: [CourseItem] = []
    var work: String?
}


