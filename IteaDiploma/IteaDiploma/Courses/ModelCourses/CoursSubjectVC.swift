//
//  CoursSubjectVC.swift
//  IteaDiploma
//
//  Created by Valeriia Zakharova on 24.11.2019.
//  Copyright © 2019 valeriikaaa. All rights reserved.
//

import UIKit

class CoursSubjectVC: UIViewController {
    
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!
    
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var users: [User] = []
    var courseSubjects: [CourseSubject] = []
    
    var filterTime = FilterTime.none
    var filterType = FilterType.none
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateCourses()
        updateView()
        collectionView.register(UINib(nibName: "CourseSubjCell", bundle: nil), forCellWithReuseIdentifier: "CourseSubjCell")
        collectionView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateCourses()
        collectionView.reloadData()
    }
    
    @IBAction func gogTapGoToProfile(_ sender: Any) {
        let storyboardCourses = UIStoryboard(name: "Courses", bundle: nil)
        let vc = storyboardCourses.instantiateViewController(identifier: "ProfilVC") as! ProfilVC
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func didTapGoToFilter(_ sender: Any) {
        let storyboardCourses = UIStoryboard(name: "Courses", bundle: nil)
        let vc = storyboardCourses.instantiateViewController(identifier: "FilterVC") as! FilterVC
        
        vc.filterType = filterType
        vc.filterTime = filterTime
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension CoursSubjectVC:  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return courseSubjects.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CourseSubjCell", for: indexPath) as! CourseSubjCell
        cell.updateCell(data: courseSubjects[indexPath.row])
        cell.updateCellContent()
//        cell.contentView.layer.cornerRadius = cell.contentView.bounds.height / 2
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let offset = CGFloat(5)
        let elementsPerRow = CGFloat(2)
        let totalOffsetSize = offset * (elementsPerRow + 1)
        var sideSize = (collectionView.frame.width - totalOffsetSize) / elementsPerRow
        sideSize = floor(sideSize)
        
        return CGSize(width: sideSize, height: sideSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyboardCourses = UIStoryboard(name: "Courses", bundle: nil)
        let vc = storyboardCourses.instantiateViewController(identifier: "CourseItemVC") as! CourseItemVC
        vc.courseSubject = courseSubjects[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension CoursSubjectVC {
    
    func updateView() {
        //labels
        titleLabel.text = "ITEA - COURSES"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        titleLabel.backgroundColor = .white
        titleLabel.layer.cornerRadius = 10
        titleLabel.clipsToBounds = true
        
        //buttons
        profileButton.setTitle("PROFILE", for: .normal)
        profileButton.backgroundColor = .white
        profileButton.layer.cornerRadius = 10
        profileButton.clipsToBounds = true
        filterButton.setTitle("FILTER", for: .normal)
        filterButton.backgroundColor = .white
        filterButton.layer.cornerRadius = 10
        filterButton.clipsToBounds = true
        //textfield
        searchTextField.borderStyle = .roundedRect
        
        //image view
        
        coverImage.image = UIImage(named: "itea")
    }
    
    func updateCourses() {
        var subjects = Storage().makeCourseSubject()
        
        subjects = subjects.filter({ subject -> Bool in
            if filterType == .none {
                return true
            } else {
                return subject.type == filterType.name()
            }
        })
        
        subjects = subjects.filter({ subject -> Bool in
            if filterTime == .none {
                return true
            } else {
                return subject.time == filterTime.name()
            }
        })
        
        self.courseSubjects = subjects
    }
}
