//
//  WeekDayView.swift
//  FeetnessApp
//
//  Created by Руслан Новиков on 19.12.24.
//

import UIKit

extension WeekView {
    final class WeekDayView: WABaseView {
        private let nameLabel = UILabel()
        private let dateLabel = UILabel()
        private let stackView = UIStackView()
        
        func configure (with index: Int, and name: String) {
            let startWeek = Date().startOfWeek
            let currentDay = startWeek.goForward(to: index)
            let day = Calendar.current.component(.day, from: currentDay)
            
            let isToday = currentDay.stripTime() == Date().stripTime()
            
            backgroundColor = isToday ? R.Colors.active : R.Colors.backGround
            
            nameLabel.text = name.uppercased()
            nameLabel.textColor = isToday ? .white : R.Colors.inactive
            
            dateLabel.text = "\(day)"// интерполяция
            dateLabel.textColor = isToday ? .white : R.Colors.inactive
        }
        
    }
}

extension WeekView.WeekDayView {
    override func setupViews() {
        super.setupViews()
        
        setupView(stackView)
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(dateLabel)
        

    }
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            

        ])
    }
    override func configureAppearance() {
        super.configureAppearance()
        
        layer.cornerRadius = 5
        layer.masksToBounds = true//обрезает содержимое при выходе за границу
        
        nameLabel.font = R.Fonts.helveticaRegular(with: 9)
        nameLabel.textAlignment = .center
        
        dateLabel.font = R.Fonts.helveticaRegular(with: 15)
        dateLabel.textAlignment = .center
        
        backgroundColor = .red
        
        stackView.spacing = 3
        stackView.axis = .vertical
        
    }
}
