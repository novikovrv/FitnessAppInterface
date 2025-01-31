//
//  SettingsController.swift
//  FeetnessApp
//
//  Created by Руслан Новиков on 15.12.24.
//
import UIKit

class SettingsController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = R.Strings.NavBar.settings
        navigationController?.tabBarItem.title = R.Strings.TabBar.title(for: .settings)
        
    }


}
