//
//  OverviewNavBar.swift
//  FeetnessApp
//
//  Created by Руслан Новиков on 18.12.24.
//

import UIKit

class OverviewNavBar: WABaseView {
    
    private let allWorkoutsButton: WAButton = {
        let button = WAButton(with: .secondary)
        button.setTitle(R.Strings.Overview.allWorkoutsButton)
        return button
    }()
    
    private let addButton: UIButton = {
        let addButton = UIButton()
        addButton.setImage(R.Images.Common.addButton, for: .normal)
        return addButton
    }()
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = R.Strings.NavBar.overview
        titleLabel.textColor = R.Colors.titleGray
        titleLabel.font = R.Fonts.helveticaRegular(with: 22)
        return titleLabel
    }()
    
    private let weakView = WeekView()
    
    override func layoutSubviews() {// так как на момент вызова функции addBottomBoreder вью не знаеи свой фрейм нам нужен layoutSubviews
        super.layoutSubviews()
        addBottomBoreder(with: R.Colors.separator, height: 1)
    }
    
    func allWorkoutsButtonAction(_ action: Selector, with target: Any?) {
        allWorkoutsButton.addTarget(target, action: action, for: .touchUpInside)
    }
    func addAdditingAction(_ action: Selector, with target: Any?) {
        addButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
}

extension OverviewNavBar {
    override func setupViews(){
        super.setupViews()
        
        setupView(allWorkoutsButton)
        setupView(addButton)
        setupView(titleLabel)
        setupView(weakView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            addButton.heightAnchor.constraint(equalToConstant: 28),
            addButton.widthAnchor.constraint(equalToConstant: 28),
        
            allWorkoutsButton.topAnchor.constraint(equalTo: addButton.topAnchor),
            allWorkoutsButton.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -15),
            allWorkoutsButton.heightAnchor.constraint(equalToConstant: 28),
            //allWorkoutsButton.widthAnchor.constraint(equalToConstant: 130),
            
            titleLabel.centerYAnchor.constraint(equalTo: allWorkoutsButton.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: allWorkoutsButton.leadingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            weakView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 15),
            weakView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            weakView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            weakView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            weakView.heightAnchor.constraint(equalToConstant: 47),
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        backgroundColor = .white
    }
}
        
