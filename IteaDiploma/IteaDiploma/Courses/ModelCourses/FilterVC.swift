//
//  FilterVC.swift
//  IteaDiploma
//
//  Created by Valeriia Zakharova on 24.11.2019.
//  Copyright © 2019 valeriikaaa. All rights reserved.
//

import UIKit

enum FilterTime {
    case daily
    case evening
    case none
}

enum FilterType {
    case qa
    case frontend
    case programming
    case design
    case marketing
    case sysAdmin
    case none
}

class FilterVC: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var filterLabel: UILabel!
    @IBOutlet weak var filterByTypeLabel: UILabel!
    
    @IBOutlet weak var dailyButton: UIButton!
    @IBOutlet weak var eveningButton: UIButton!
    @IBOutlet weak var qAButton: UIButton!
    @IBOutlet weak var frotendButton: UIButton!
    @IBOutlet weak var programmingButton: UIButton!
    @IBOutlet weak var designButton: UIButton!
    @IBOutlet weak var marketingButton: UIButton!
    @IBOutlet weak var systemAdmButton: UIButton!
    
    var filterTime = FilterTime.none
    var filterType = FilterType.none
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    // MARK: - Action Times
    
    @IBAction func didTapDailyFilter(_ sender: Any) {
        if filterTime == .daily {
            filterTime = .none
        } else {
            filterTime = .daily
        }
        updateTimesUI()
    }
    @IBAction func didTapEveningFilter(_ sender: Any) {
        if filterTime == .evening {
            filterTime = .none
        } else {
            filterTime = .evening
        }
        updateTimesUI()
    }
    
    // MARK: - Action Types
    
    @IBAction func didTapOAFilter(_ sender: Any) {
        if filterType == .qa {
            filterType = .none
        } else {
            filterType = .qa
        }
        updateTypesUI()
    }
    @IBAction func didTapFrotendFilter(_ sender: Any) {
        if filterType == .frontend {
            filterType = .none
        } else {
            filterType = .frontend
        }
        updateTypesUI()
    }
    @IBAction func didTapProgrFilter(_ sender: Any) {
        if filterType == .programming {
            filterType = .none
        } else {
            filterType = .programming
        }
        updateTypesUI()
    }
    @IBAction func didTapDesignFilter(_ sender: Any) {
        if filterType == .design {
            filterType = .none
        } else {
            filterType = .design
        }
        updateTypesUI()
    }
    @IBAction func didTapMarkrtingFilter(_ sender: Any) {
        if filterType == .marketing {
            filterType = .none
        } else {
            filterType = .marketing
        }
        updateTypesUI()
    }
    @IBAction func didTapSystAdFilter(_ sender: Any) {
        if filterType == .sysAdmin {
            filterType = .none
        } else {
            filterType = .sysAdmin
        }
        updateTypesUI()
    }
    @IBAction func didTapConfirmFilter(_ sender: Any) {
        let storyboardCourses = UIStoryboard(name: "Courses", bundle: nil)
        let vc = storyboardCourses.instantiateViewController(identifier: "CoursSubjectVC") as! CoursSubjectVC
        vc.filterType = filterType
        vc.filterTime = filterTime
        navigationController?.pushViewController(vc, animated: false)
    
    }
}

extension FilterVC {
    
    func updateUI() {
        
        titleLabel.text = "FILTER"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        titleLabel.backgroundColor = .red
        titleLabel.layer.cornerRadius = 12
        titleLabel.clipsToBounds = true
        
        filterLabel.text = "By Time"
        filterLabel.textAlignment = .center
        filterLabel.textColor = .black
        filterLabel.backgroundColor = .red
        filterLabel.layer.cornerRadius = 12
        filterLabel.clipsToBounds = true
        
        filterByTypeLabel.text = "By Tyme"
        filterByTypeLabel.textAlignment = .center
        filterByTypeLabel.textColor = .black
        filterByTypeLabel.backgroundColor = .red
        filterByTypeLabel.layer.cornerRadius = 12
        filterByTypeLabel.clipsToBounds = true
        
        
    }
    
    /// обновляет кнопки для времен в соответсвии с моделями
    func updateTimesUI() {
        let isTimeDaily = filterTime == .daily
        dailyButton.isSelected = isTimeDaily
        
        let isTimeEvening = filterTime == .evening
        eveningButton.isSelected = isTimeEvening
    }
    
    /// обновляет кнопки для типов в соответсвии с моделями
    func updateTypesUI() {
        // если флаг включена то и кнопка должна быть включена
        qAButton.isSelected = filterType == .qa
        frotendButton.isSelected = filterType == .frontend
        programmingButton.isSelected = filterType == .programming
        designButton.isSelected = filterType == .design
        marketingButton.isSelected = filterType == .marketing
        systemAdmButton.isSelected = filterType == .sysAdmin
    }
}
//запомнить строку и передовать на предыдущий вью контроллер








