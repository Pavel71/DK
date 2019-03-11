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
  
  private  var email = ""
  private  var password = ""
  
  private var registerModel = RegisterModel()
  
  private var models: [HeaderModels] = [.info, .sex, .birthday]
  
  private let datePickerView: UIDatePicker = {
    let picker = UIDatePicker()
    picker.maximumDate = Date()
    picker.datePickerMode = .date
    
    
    
    // add toolbar to textField
    return picker
  }()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Регистрация"
    registerCells()
    delegateing()
    
    
    configureDatePickerView()
    addRightBarButton()
    
    // Попробую передать информацию через Notification
    
    setNotification()
    
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    // Снять все обсерверы и тогда не будет коллизий
    NotificationCenter.removeObserver(self, forKeyPath: Notification.Name.didTextFieldEnding.rawValue)
  }

  // MARK: Notification method
  
  func setNotification() {
    // Устанавливаем приемник На нажатие на текстовые поля
    NotificationCenter.default.addObserver(self, selector: #selector(textDidChangeEnd), name: UITextField.textDidEndEditingNotification, object: nil)
    
    // Устанавливаем приемник на нажатие на загрузить фото
    NotificationCenter.default.addObserver(self, selector: #selector(photoViewClickedSelect), name: .didClickedAddPhoto, object: nil)
    
  }
  
  // Обрабатываем текстовые поля! Метод ловит все изменения во всех текстовых полях на экране
  @objc func textDidChangeEnd(ncParam: NSNotification) {
    
    print(ncParam)

    print("Notification Text Field ")
    guard let textField = ncParam.object as? UITextField else {
      fatalError("Не получил объект")
    }
    
    if let stringField = textField.text {
      
      switch textField.tag {
      case 0:
        registerModel.email = stringField

      case 1:
        registerModel.password = stringField
      case 2:
        registerModel.birthday = datePickerView.date

        let format = DateFormatter()
        format.dateFormat = "dd/MM/yyyy"
        // Хочу чтобы дата отображалась в поле
        textField.text = format.string(from: datePickerView.date)

      default: break
      }
    }
    
  }
  
  // Через Клоузер
  private func workWithTextFields(textField: UITextField) {
    
    if let stringField = textField.text {
      
      switch textField.tag {
      case 0:
        email = stringField
      case 1:
        password = stringField
        
      default: break
      }
    }
    
  }
  
  private func addRightBarButton() {
    
    // Создаем кнопку и срзу на нее прописываем target
    let barButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(rightBarButtonClicked))
    
    navigationItem.rightBarButtonItem = barButton
  }
  
  @objc private func rightBarButtonClicked(sender: UIBarButtonItem) {
    
    guard registerModel.isFilled else {
      showAlert(with: "Ошибка", and: "Пожалуйста заполните все поля")
      return
    }
    
    AuthManager.shared.register(with: registerModel) {
      
      showAlert(with: "Успешно", and: "Вы зарегестрированны")
    }

  }
  
  
  // MARK: DatePicker - Обработка
  private func configureDatePickerView() {
    // Можно через делегат запилить
    datePickerView.addTarget(self, action: #selector(datePickerChanged(sender:)), for: .valueChanged)
    
  }
  
  @objc private func datePickerChanged(sender: UIDatePicker) {
    let date = sender.date
    registerModel.birthday = date
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
  
  // Метод срабатывает когда уходим из контроллера и преходим к другому
  // Тогда и можно снять обсерверы
 
  
  private func delegateing() {
    
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  // Notification
  @objc func photoViewClickedSelect() {
    
    print("Работает Notification")
    let imagePickerController = UIImagePickerController()
    imagePickerController.delegate = self
    imagePickerController.sourceType = .photoLibrary
    present(imagePickerController,animated: true,completion: nil)
  }
  
  
  private func photoViewClicked() {
    
    let imagePickerController = UIImagePickerController()
    imagePickerController.delegate = self
    imagePickerController.sourceType = .photoLibrary
    present(imagePickerController,animated: true,completion: nil)
  }
  
  private func registerCells() {
    
    tableView.register(UserInfoTableViewCell.nib, forCellReuseIdentifier: UserInfoTableViewCell.name)
    
    tableView.register(SexTableViewCell.nib, forCellReuseIdentifier: SexTableViewCell.name)
    
    tableView.register(BirthdayTableViewCell.nib, forCellReuseIdentifier: BirthdayTableViewCell.name)
  }
  
  private func setSexSegmentValue() {
    
    // В зависимости от выбранного сегмента Устанавливаем значение в модель
    registerModel.sex = sexSegment.selectedSegmentIndex == 0 ? .male : .female

  }
  
  // Нажимаем кнопку и собираютс данные для регистрации
  @IBAction func pushRegisterButton(_ sender: UIButton) {
    
    setSexSegmentValue()
    
    print("Кнопочка")
    print("Пол - \(String(describing: registerModel.sex?.rawValue))")
    print("Email - \(registerModel.email) Password - \(registerModel.password)")
    print("День рождения \(registerModel.birthday)")
    
    
    AuthManager.shared.register(with: registerModel) {
      
      showAlert(with: "Успешно", and: "Вы зарегестрированны")
    }
  }
  
  
}

// MARK: UINavigationControllerDelegate

extension RegisterViewController: UINavigationControllerDelegate {
  
}

// MARK: UIImagePickerViewController

extension RegisterViewController: UIImagePickerControllerDelegate {
  
  // Метод который откроет фотки
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
    picker.dismiss(animated: true, completion: nil)
    
    guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
      fatalError("Нет картинки")
    }
    
    registerModel.photo = image
    tableView.reloadData()
    
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
        

        
        // Передал ссылк из метода делегата в этот файл
//        cell.textFieldEndEdid = workWithTextFields
        
        // Теперь эта ячейка имеет блок кода который исполнится при нажатие на нее в этом контроллере
//        cell.photoViewClicked = photoViewClicked
        
        // Для наглядности
        cell.emailTextField.tag = 0
        cell.passwordTextField.tag = 1
        
        cell.set(image: registerModel.photo)
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
        
        // Установим toolbar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        
        // Кнопка // Можно настроить ее обработку!
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: nil)
        
        toolbar.setItems([doneButton], animated: false)
        
        // Можем поместить pickerView в textField
        // Устанавливаем tag
        cell.birthdayTextField.tag = 2
        cell.birthdayTextField.inputAccessoryView = toolbar
        cell.birthdayTextField.inputView = datePickerView
        return cell
      }
      
    default: break
      
    }
    
    return UITableViewCell()
    
    
  }
  
  
}


