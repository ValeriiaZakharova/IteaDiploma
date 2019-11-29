//
//  CourseItemVC.swift
//  IteaDiploma
//
//  Created by Valeriia Zakharova on 24.11.2019.
//  Copyright © 2019 valeriikaaa. All rights reserved.
//

import UIKit

class CourseItemVC: UIViewController {
    
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var coverImage: UIImageView!
    
    var courseSubject: CourseSubject!
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        tableView.register(UINib(nibName: "CourseItemCell", bundle: nil), forCellReuseIdentifier: "CourseItemCell")
        tableView.reloadData()
    }
    
    ///Go back button
    @IBAction func didTapGoBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension CourseItemVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courseSubject.courseItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CourseItemCell", for: indexPath) as! CourseItemCell
        let item = courseSubject.courseItem
        cell.updateCell(data: item[indexPath.row])
        cell.updateCellUI()
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboardCourses = UIStoryboard(name: "Courses", bundle: nil)
        let vc = storyboardCourses.instantiateViewController(identifier: "CourseDescriptionVC") as! CourseDescriptionVC
        vc.courseItem = courseSubject.courseItem[indexPath.row]
        vc.user = user
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension CourseItemVC {
    
    func updateUI() {
        coverImage.image = UIImage(named: "itea")
        titleLable.backgroundColor = .white
        titleLable.text = courseSubject.title
        titleLable.textAlignment = .center
        titleLable.layer.cornerRadius = 15
        titleLable.clipsToBounds = true

    }
}
