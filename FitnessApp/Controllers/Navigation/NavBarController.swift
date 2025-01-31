//
//  NavigationBar.swift
//  FeetnessApp
//
//  Created by Руслан Новиков on 14.12.24.
//

import UIKit

final class NavBarController: UINavigationController {
    override func viewDidLoad() {//вызывается после того, как контроллер загружает свое представление в память. Это идеальное место для выполнения начальной настройки
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .white
        navigationBar.isTranslucent = false // окрашивает все пространство в том числе под статус баром
        navigationBar.standardAppearance.titleTextAttributes = [.foregroundColor: R.Colors.titleGray, .font: R.Fonts.helveticaRegular(with: 17)]
        
        navigationBar.addBottomBoreder(with: R.Colors.separator, height: 1)// UIView extension
    }
    
    
    
    
}
