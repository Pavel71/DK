//
//  RegisterViewController.swift
//  First_Part
//
//  Created by PavelM on 28/02/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    private var models: [CellModel] = [.userInfo] //.barthday, .sex
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Регистрация"
        registerCells()
        delegateing()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        // Прячем навигационный бар
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    
    
    
    
    private func delegateing() {
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func registerCells() {

        tableView.register(UserInfoTableViewCell.nib, forCellReuseIdentifier: UserInfoTableViewCell.name)
    }

    
}

// MARK: CELLMODEL

extension RegisterViewController {
    
    fileprivate enum CellModel {
        case userInfo
        case sex
        case barthday
    }
}

// MARK: TableVew DELEGATE
extension RegisterViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = models[indexPath.row]
        
        switch model {
        case.userInfo:
            return 100
        default: return 0
            
        }
    
    }
    
}

// MARK: TableVew DATASOURCE
extension RegisterViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = models[indexPath.row]
        
        switch model {
            
        case.userInfo:
            if let cell = tableView.dequeueReusableCell(withIdentifier: UserInfoTableViewCell.name, for: indexPath) as? UserInfoTableViewCell {
                return cell
            }
            
        default: break
            
        }
        
        return UITableViewCell()
        
        
    }
    
    
}
