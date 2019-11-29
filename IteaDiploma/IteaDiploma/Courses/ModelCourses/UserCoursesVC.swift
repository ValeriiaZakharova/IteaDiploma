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
    @IBOutlet weak var coverImage: UIImageView!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "UserCourseCell", bundle: nil), forCellReuseIdentifier: "UserCourseCell")
        coverImage.image = UIImage(named: "itea")
        tableView.reloadData()
    }
    
    @IBAction func didTapGoback(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension UserCoursesVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
        case 1:
            return user.completedCourses.count
        default:
            fatalError()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCourseCell", for: indexPath) as! UserCourseCell
        
        switch indexPath.section {
        case 0:
            cell.courseTitleLabel.text = user.currentCourse.title
            cell.courseCoverImageView.image = user.currentCourse.image
        case 1:
            cell.courseTitleLabel.text = user.completedCourses[indexPath.row].title
            cell.courseCoverImageView.image = user.completedCourses[indexPath.row].image
        default:
            fatalError()
        }
        cell.updateCellUI()
        print("section: \(indexPath.section) row: \(indexPath.row) text: \( cell.courseTitleLabel.text ?? "0")")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 44))
        view.backgroundColor = UIColor.white
        let label = UILabel(frame: view.frame)
        label.backgroundColor = .white
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        switch section {
        case 0 :
            label.text = "Current courses"
        case 1:
            label.text = "Completed courses"
        default:
            fatalError()
        }
        view.addSubview(label)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected row at indexPath: section:\(indexPath.section) row: \(indexPath.row)")
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
}
