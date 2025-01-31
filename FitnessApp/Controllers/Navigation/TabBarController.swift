//
//  TabBarController.swift
//  FeetnessApp
//
//  Created by Руслан Новиков on 14.12.24.
//

import UIKit

enum Tabs: Int, CaseIterable {
    case overview
    case session
    case progress
    case settings
}

final class TabBarController: UITabBarController {
    override func viewDidLoad() {//вызывается после того, как контроллер загружает свое представление в память. Это идеальное место для выполнения начальной настройки
        super.viewDidLoad()
        
        configure()
    }
    
    
    func swithTo(tab: Tabs) {
        selectedIndex = tab.rawValue
    }
    
    private func configure() {
        tabBar.tintColor = R.Colors.active// tint color  цвет выбранного элемента tabBar
        tabBar.barTintColor = R.Colors.inactive//bar tint color цвет не выбранного элемента tabBar
        tabBar.backgroundColor = .white
        
        tabBar.layer.borderColor = R.Colors.separator.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
        
        let controllers: [NavBarController] = Tabs.allCases.map { tab in
            let controller = NavBarController(rootViewController: getController(for: tab))
            controller.tabBarItem = UITabBarItem(title: R.Strings.TabBar.title(for: tab),
                                                 image: R.Images.TabBar.icon(for: tab),
                                                 tag: tab.rawValue)
            return controller
        }
        
        setViewControllers(controllers, animated: false)
        
        func getController(for tab: Tabs) -> BaseController {
            switch tab {
            case .overview: return OverviewController()
            case .session: return SessionController()
            case .settings: return SettingsController()
            case .progress: return ProgressController()
            }
        }
    }
}
