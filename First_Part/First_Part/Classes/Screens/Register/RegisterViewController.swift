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
    @IBOutlet weak var registerButton: UIButton!
    
    // То что передаем из других классов
    private weak var sexSegment: UISegmentedControl!
    private weak var emailTextField: UITextField!
    private weak var passwordTextField: UITextField!
    
    private var models: [CellModel] = [.userInfo, .sex] //.barthday, .sex
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Регистрация"
        registerCells()
        delegateing()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        // Если что это все нужно будет вывести на Декоратор
        
        // Прячем навигационный бар
        navigationController?.setNavigationBarHidden(false, animated: true)
        // Большой title
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Добавлю отступ от Навигатора для ячейки
        tableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0)
        
//        tableView.separatorColor = .none
        tableView.separatorStyle = .none
        
        // Разрисуем саму View где кнопка
        view.backgroundColor  = #colorLiteral(red: 0.2980392157, green: 0.4588235294, blue: 0.6392156863, alpha: 1)
        
        registerButton.layer.borderWidth = 1
        registerButton.layer.borderColor = #colorLiteral(red: 0.9450980392, green: 0.9450980392, blue: 0.9450980392, alpha: 1)
        registerButton.layer.cornerRadius = 10
        registerButton.backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.9450980392, blue: 0.9450980392, alpha: 1)
        registerButton.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
    }
    
    
    
    
    
    
    private func delegateing() {
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func registerCells() {

        tableView.register(UserInfoTableViewCell.nib, forCellReuseIdentifier: UserInfoTableViewCell.name)
        
        tableView.register(SexTableViewCell.nib, forCellReuseIdentifier: SexTableViewCell.name)
    }
    
    // Нажимаем кнопку и собираютс данные для регистрации
    @IBAction func pushRegisterButton(_ sender: UIButton) {
        
        print("Кнопочка")
        
        print(sexSegment.selectedSegmentIndex)
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
        case.sex:
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
        case.sex:
            if let cell = tableView.dequeueReusableCell(withIdentifier: SexTableViewCell.name, for: indexPath) as? SexTableViewCell {
                
                // передадим сегмент под управление этого TableView
                sexSegment = cell.sexSegment
                print(sexSegment.selectedSegmentIndex)
                
                return cell
            }
            
        default: break
            
        }
        
        return UITableViewCell()
        
        
    }
    
    
}


