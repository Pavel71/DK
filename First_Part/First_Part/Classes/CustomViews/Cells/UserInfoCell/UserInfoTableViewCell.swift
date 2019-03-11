//
//  UserInfoTableViewCell.swift
//  First_Part
//
//  Created by PavelM on 28/02/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit
// TypeAliases
class UserInfoTableViewCell: UITableViewCell, StaticCellProtocol {
  
  // Это View с полями для ввода Данных
  @IBOutlet weak var backgroundFieldsView: UIView!
  
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  
  @IBOutlet weak var photoView: PhotoView!
  // Я бы сюда добавил также и поле с Stack view!
  
  // Сейчас нужно добавить клоузер который будет передавать упарвление методу делегату при заканчивание писание текста в поле
  var textFieldEndEdid: ((UITextField) -> Void)?
  
  // Клоузер который передает процедуру по цепочке к методу который исполняется каждый раз при нажатии на кнопку добавить фото
  
  
//  var photoViewClicked: VoidClouser? {
//    didSet {
//      photoView.clicked = photoViewClicked
//    }
//  }
  
  
  
  static var height: CGFloat {
    return 100
  }
  
  // Когда регистрируем nib
  override func awakeFromNib() {
    super.awakeFromNib()
    
    // Прорисовка
    Decorator.decorate(cell: self)
    
    emailTextField.delegate = self
    passwordTextField.delegate = self
    
    // Добавили наблюдателя и теперь когда этот метод сработает мы запросим выполнение нашей функции
   
    
  }
  
  
  
  func set(image: UIImage?) {
    photoView.set(image: image)
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    
  }
  
}

// С другой стороны нужно больше абстракций чтобы можно было применять 1 класс к любым text Fieldam

// Попробовать использовать Notification Center

extension UserInfoTableViewCell: UITextFieldDelegate {
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    
    // Передам эту ссылку в другой файл чтобы там срабатывал код каждый раз как сработает этот делегат
//    textFieldEndEdid?(textField)
    
    // для примера
//    let scores = ["Bob": 5, "Alice": 3, "Arthur": 42]
    // Отправляем запрос в Диспетчер для приме информации
    
//    NotificationCenter.default.post(name:.didTextFieldEnding, object: nil)
    
     /// Все я разобрался запрос дублируется так как он системный но можно сделать его самостоятельбным и с доп материалами тогда дублироватся не будет!

  }

}

// Создадим декортаор для прорисовки Нашей Ячейки

// MARK: Decorator
extension UserInfoTableViewCell {
  
  fileprivate class Decorator {
    
    static func decorate(cell: UserInfoTableViewCell) {
      
      cell.selectionStyle = .none
      // Настройка правой части с именим и паролем
      cell.backgroundFieldsView.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
      cell.backgroundFieldsView.layer.borderColor = #colorLiteral(red: 0.9450980392, green: 0.9450980392, blue: 0.9450980392, alpha: 1)
      cell.backgroundFieldsView.layer.borderWidth = 0.8
      // Общий фон всей ячейки
      cell.backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.9450980392, blue: 0.9450980392, alpha: 1)
      
    }
  }
}
