//
//  Base.swift
//  FeetnessApp
//
//  Created by Руслан Новиков on 14.12.24.
//

import UIKit

enum NavBarPosition {
    case left
    case right
}

class BaseController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        constraintViews()
        configureAppearance()
    }
}

@objc extension BaseController {
    
    func setupViews() {}
    
    func constraintViews() {}
    
    func configureAppearance() {
        view.backgroundColor = R.Colors.backGround
    }
    
    func navBarLeftButtonHandler() {
        print("NavBar Left button tapped")
    }
    
    func navBarRightButtonHandler() {
        print("NavBar Right button tapped")
    }
}

extension BaseController {
    func addNuvButton(at position: NavBarPosition, with title: String) {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(R.Colors.active, for: .normal)
        button.setTitleColor(R.Colors.inactive, for: .disabled)
        button.titleLabel?.font = R.Fonts.helveticaRegular(with: 17)
        
        switch position {
        case .left:
            button.addTarget(self, action: #selector(navBarLeftButtonHandler), for: .touchUpInside)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        case .right:
            button.addTarget(self, action: #selector(navBarRightButtonHandler), for: .touchUpInside)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        }
    }
    
    func setTitleForNavBarButton(_ title: String, at position: NavBarPosition) {
        switch position {
        case .left:
            (navigationItem.leftBarButtonItem?.customView as?
             UIButton)?.setTitle(title, for: .normal)
        case .right:
            (navigationItem.rightBarButtonItem?.customView as?
             UIButton)?.setTitle(title, for: .normal)
        }
        navigationController?.view.layoutSubviews()
    }
}
