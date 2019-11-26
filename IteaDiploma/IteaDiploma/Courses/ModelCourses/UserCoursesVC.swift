//
//  UserCoursesVC.swift
//  IteaDiploma
//
//  Created by Valeriia Zakharova on 24.11.2019.
//  Copyright © 2019 valeriikaaa. All rights reserved.
//

import UIKit

class UserCoursesVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "UserCourseCell", bundle: nil), forCellReuseIdentifier: "UserCourseCell")
        tableView.reloadData()
    }
    //layer.masktobouns = false
}

//extension UserCoursesVC: UITableViewDataSource, UITableViewDelegate {
//   func numberOfSections(in tableView: UITableView) -> Int {
//       return
//   }
//
//   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//       return
//   }
//
//   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//       let cell = tableView.dequeueReusableCell(withIdentifier: "UserCourseCell", for: indexPath) as! UserCourseCell
//
//       return cell
//   }
//
//   func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//       let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 44))
//       view.backgroundColor = UIColor.cyan
//
//
//
//       return view
//   }
//
//   func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//      return 50
//   }

//}
