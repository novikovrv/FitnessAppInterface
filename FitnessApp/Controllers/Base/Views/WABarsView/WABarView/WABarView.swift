//
//  BarView.swift
//  FeetnessApp
//
//  Created by Руслан Новиков on 30.12.24.
//

import UIKit

extension WABarView {
    struct Data {
        let value: String
        let heightMultiplayer: Double
        let title: String
    }
}

final class WABarView: WABaseView {
    private let heightMultiplayer: Double

    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 13)
        label.textColor = R.Colors.active
        return label
    }()
    
    private let barView: UIView = {
        let view = UIView()
        view.backgroundColor = R.Colors.active
        view.layer.cornerRadius = 2.5
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 9)
        label.textColor = R.Colors.inactive
        return label
    }()
    
    init(data: Data) {
        self.heightMultiplayer = data.heightMultiplayer
        super.init(frame: .zero)
        
        valueLabel.text = data.value
        titleLabel.text = data.title.uppercased()
    }
    
    @MainActor required init?(coder: NSCoder) {
        self.heightMultiplayer = 0
        super.init(frame: .zero)
    }
}
extension WABarView {
    override func setupViews() {
        super.setupViews()

        setupView(valueLabel)
        setupView(barView)
        setupView(titleLabel)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([

            valueLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            valueLabel.heightAnchor.constraint(equalToConstant: 10),
            
            barView.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 7),
            barView.centerXAnchor.constraint(equalTo: centerXAnchor),
            barView.widthAnchor.constraint(equalToConstant: 17),
            barView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: heightMultiplayer * 0.8),

            
            titleLabel.topAnchor.constraint(equalTo: barView.bottomAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 10),
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        backgroundColor = .clear
    }
}

