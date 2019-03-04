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
  
  private var models: [HeaderModels] = [.info, .sex, .birthday]
  
  private let datePickerView: UIDatePicker = {
    let picker = UIDatePicker()
    picker.maximumDate = Date()
    
    return picker
  }()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Регистрация"
    registerCells()
    delegateing()
    
    
    configureDatePickerView()
    
  }
  
  private func configureDatePickerView() {
    
    datePickerView.addTarget(self, action: #selector(datePickerChanged(sender:)), for: .valueChanged)
    
  }
  
  @objc private func datePickerChanged(sender: UIDatePicker) {
    let date = sender.date
    print(date)
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
    
    // Скрыть таблицу при слайде по таблице
    tableView.keyboardDismissMode = .onDrag

    
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
    
    tableView.register(BirthdayTableViewCell.nib, forCellReuseIdentifier: BirthdayTableViewCell.name)
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
    case birthday
  }
  
  fileprivate enum HeaderModels: CellHeaderProtocol {
    typealias CellType = CellModel
    case sex
    case info
    case birthday
    
    var cellModel: [RegisterViewController.CellModel] {
      
      switch self {
      case.info: return [.userInfo]
      case.sex: return [.sex]
      case.birthday: return [.birthday]
      }
    }
    
  }
}

// MARK: TableVew DELEGATE
extension RegisterViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let model = models[indexPath.section].cellModel[indexPath.row]
    
    switch model {
    case.userInfo, .sex:
      return 100
    case.birthday:
      return 50
      
    }
    
  }
  
}

// MARK: TableVew DATASOURCE
extension RegisterViewController: UITableViewDataSource {
  
  // Этот метода загрузит заголовок для новой секции в tableView
  // Нужен список Headerof и список по секциям
  
  //////////////////////////////////////////////////////////////////////////////////
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    
    let headerModel = models[section]
    switch headerModel {
    case.sex:
      let view = HeaderTitleView.loadFromNib()
      view.setTitle(title: "Ваш пол")
      return view
    default: return nil
    }
    
  }
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    
    let headerModel = models[section]
    switch headerModel {
    case.sex:
      let view = HeaderTitleView.loadFromNib()
      view.setTitle(title: "Ваш пол")
      return 44
    default: return 0
    }
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return models.count
  }
  /////////////////////////////////////////////////////////////////////////////////////
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    // models.count
    
    return models[section].cellModel.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let model = models[indexPath.section].cellModel[indexPath.row]
    
    switch model {
      
    case.userInfo:
      if let cell = tableView.dequeueReusableCell(withIdentifier: UserInfoTableViewCell.name, for: indexPath) as? UserInfoTableViewCell {
        return cell
      }
      
    case.sex:
      if let cell = tableView.dequeueReusableCell(withIdentifier: SexTableViewCell.name, for: indexPath) as? SexTableViewCell {
        
        // Это дядя Данила
        cell.indexChanged = { index in
          print("Дядя Данила \(index)")
        }
        
        
        // Это Дядя Паша Стайл
        // передадим сегмент под управление этого TableView
        sexSegment = cell.sexSegment
        print("Pavel \(sexSegment.selectedSegmentIndex)")
        
        return cell
      }
      
    case .birthday:
      
      if let cell = tableView.dequeueReusableCell(withIdentifier: BirthdayTableViewCell.name, for: indexPath) as? BirthdayTableViewCell {
        cell.set(text: "Дата рождения:")
        
        // Можем поместить pickerView в textField
        cell.birthdayTextField.inputView = datePickerView
        return cell
      }
      
    default: break
      
    }
    
    return UITableViewCell()
    
    
  }
  
  
}


