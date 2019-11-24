//
//  MakeUser.swift
//  IteaDiploma
//
//  Created by Valeriia Zakharova on 22.11.2019.
//  Copyright © 2019 valeriikaaa. All rights reserved.
//

import Foundation
import UIKit

class MakeUser {
    
    func makeUser() -> User {
        
        let user1 = User()
        user1.name = "Valeriia"
        user1.surName = "Zakharova"
        user1.age = 27
        user1.birthday = "20.12.1991"
        user1.city = "Kharkiv"
        user1.email = "valeriia@gmail.com"
        user1.password = "qweasdzxc"
        user1.phone = "+380996849017"
        user1.photo = UIImage(named: "photo")
        //user1.completedCourses =
        //user1.currentCourses =
        return user1
    }
}
