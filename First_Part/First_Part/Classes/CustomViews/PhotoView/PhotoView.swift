//
//  PhotoView.swift
//  First_Part
//
//  Created by PavelM on 28/02/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit

// Этот класс и Элемент програмирруется кодом от начала до конца Так его можно было сделать в Xib

class PhotoView: UIView {
    
    private let stackView = UIStackView()
    private let plusView = UIImageView()
    private let label = UILabel()

    // Я так понял это жизненый цикл UIView и у него есть свли методы когда и что лучше использовать
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()

        
        addStackView()
        addPlusView()
        addLabel()
        
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        Decorator.layoutSubview(self)
        Decorator.decorator(self)
    }
    
    // MARK: AddLabel
    
    private func addLabel() {
        
        label.text = "фото"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = #colorLiteral(red: 0.2980392157, green: 0.4588235294, blue: 0.6392156863, alpha: 1)
        
        stackView.addArrangedSubview(label)
        
        
    }
    
    // MARK: PlusView
    
    private func addPlusView() {
        // Наполняем изображения корректно по View
        plusView.contentMode = .scaleAspectFit
        //Если выбрать в параметре картинки Render as Tempalate Image то можно менять цвет как хочешь
        plusView.tintColor = #colorLiteral(red: 0.2980392157, green: 0.4588235294, blue: 0.6392156863, alpha: 1)
        plusView.image = UIImage(named: "add")
        
        
        
     
        
        // Добавляем нашу картинку в stackview
        stackView.addArrangedSubview(plusView)
        
        // Подкорректируем размер Плюсика
        // Лучше делать через мультиплаер тогда будет растяжка
        // 0.25 от Stackview
        plusView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.25).isActive = true
        plusView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25).isActive = true
    }
    
    // MARK: StackView
    private func addStackView() {
        
        addSubview(stackView)
        
        
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Равные пропуски
        stackView.distribution = .equalSpacing
        // Все что будет в stackView должно располагатся в центре
        stackView.alignment = .center
        //?
        stackView.axis = .vertical
        
        // Здесь вообщем нужно будет прописать констраинты
        
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true

        
    }

}


extension PhotoView {
    
    // FilePrivate имеет доступ при наследование ТОесть он букально ограничен только файлом
    
    // Private же не имеет доступа при наследование
    // Его можно использовать только при расширениях и внутри 1ого файла
    
    // MARK: - Decorator
    fileprivate class Decorator {
        
        static func decorator(_ view: PhotoView) {
            
            view.layer.borderColor = #colorLiteral(red: 0.9450980392, green: 0.9450980392, blue: 0.9450980392, alpha: 1)
            view.layer.borderWidth = 1
            view.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            
        }
        
        static func layoutSubview(_ view: PhotoView) {
            
            view.round()
            
            
        }
        
    }
    
    
}
