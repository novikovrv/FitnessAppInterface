//
//  PerformanceView.swift
//  FeetnessApp
//
//  Created by Руслан Новиков on 31.12.24.
//

import UIKit

final class MonthlyPerformanceView: WABaseInfoView {
    
    private let chartsView = WAChartsView()
    
    func configure(with items: [WAChartsView.Data]) {
        chartsView.configure(with: items)
    }
    
}

extension MonthlyPerformanceView {
    override func setupViews() {
        super.setupViews()
        
        setupView(chartsView)
        
    }
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            chartsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            chartsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            chartsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            chartsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
        ])
        
    }
    override func configureAppearance() {
        super.configureAppearance()
        //chartsView.backgroundColor = .cyan
    }
}
