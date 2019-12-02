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
    
    func name() -> String {
        switch self {
        case .daily: return "Daytime"
        case .evening: return "Evening"
        case .none: return ""
        }
    }
}

enum FilterType {
    case qa
    case frontend
    case programming
    case design
    case marketing
    case sysAdmin
    case none
    
    func name() -> String {
        switch self {
        case .design: return "Design"
        case .frontend: return "Frontend"
        case .marketing: return "Marketing"
        case .none: return ""
        case .programming: return "Programming"
        case .qa: return "QA"
        case .sysAdmin: return "System administrator"
        }
    }
    
}

class FilterVC: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var filterLabel: UILabel!
    @IBOutlet weak var filterByTypeLabel: UILabel!
    
    @IBOutlet weak var coverImage: UIImageView!
    
    @IBOutlet weak var dailyButton: UIButton!
    @IBOutlet weak var eveningButton: UIButton!
    @IBOutlet weak var qAButton: UIButton!
    @IBOutlet weak var frotendButton: UIButton!
    @IBOutlet weak var programmingButton: UIButton!
    @IBOutlet weak var designButton: UIButton!
    @IBOutlet weak var marketingButton: UIButton!
    @IBOutlet weak var systemAdmButton: UIButton!
    @IBOutlet weak var confirmButton: UIButton!
    
    var filterTime = FilterTime.none
    var filterType = FilterType.none
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        updateTimesUI()
        updateTypesUI()
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
        
        if let navigationcontrollers = navigationController?.viewControllers {
            if let courseSubjectVc = navigationcontrollers[navigationcontrollers.count - 2] as? CoursSubjectVC {
                courseSubjectVc.filterType = filterType
                courseSubjectVc.filterTime = filterTime
            }
        }
        navigationController?.popViewController(animated: false)
    }
    @IBAction func didTapGoBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension FilterVC {
    
    func updateUI() {
        coverImage.image = UIImage(named: "itea")
        
        confirmButton.clipsToBounds = true
        confirmButton.backgroundColor = .white
        confirmButton.layer.cornerRadius = 12
        confirmButton.clipsToBounds = true
        
        titleLabel.text = "FILTER"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        titleLabel.backgroundColor = .white
        titleLabel.layer.cornerRadius = 12
        titleLabel.clipsToBounds = true
        
        filterLabel.text = "By Time"
        filterLabel.textAlignment = .center
        filterLabel.textColor = .black
        filterLabel.backgroundColor = .white
        filterLabel.layer.cornerRadius = 12
        filterLabel.clipsToBounds = true
        
        filterByTypeLabel.text = "By Tyme"
        filterByTypeLabel.textAlignment = .center
        filterByTypeLabel.textColor = .black
        filterByTypeLabel.backgroundColor = .white
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


// добавить алерт если нет такого фильтра





