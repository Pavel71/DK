//
//  ViewController.swift
//  First_Part
//
//  Created by PavelM on 28/02/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var logoLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var registerButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Decoratro.decoreate(self)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        // Прячем навигационный бар
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    
    // Либо работать через 1 метод! либо через 2
    // В простом случаее перехода можно и остваить 1 метода если логика серьезная при нажатии на кнопку то лучше разбить методы
    @IBAction func pushButton(_ sender: UIButton) {
        
        // Нужно использовать tag
        
        if sender.tag == 2 {
            
            StartRouter.shared.goToRegisterScreen(from: self)
        }

        
    }

}





// специальное расширение для Вырисовывания View! Довольно удобно

extension ViewController {
    
    fileprivate class Decoratro {
        
        static let buttonCornerRadius: CGFloat = 10
        private init() {}
        static func decoreate(_ vc: ViewController) {
            
            vc.startButton.layer.cornerRadius = buttonCornerRadius
            vc.startButton.layer.borderColor = #colorLiteral(red: 0.9450980392, green: 0.9450980392, blue: 0.9450980392, alpha: 1)
            
            vc.registerButton.layer.cornerRadius = buttonCornerRadius
            vc.registerButton.layer.borderColor = #colorLiteral(red: 0.9450980392, green: 0.9450980392, blue: 0.9450980392, alpha: 1)
            
            
        }
    }
    
}

