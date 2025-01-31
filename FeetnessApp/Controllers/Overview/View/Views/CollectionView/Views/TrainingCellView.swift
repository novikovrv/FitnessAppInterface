//
//  TrainingCellView.swift
//  FeetnessApp
//
//  Created by Руслан Новиков on 5.01.25.
//

import UIKit

final class TrainingCellView: UICollectionViewCell {
    
    static let id = "TrainingCellView"
    
    private let checkMarkView = UIImageView(image: R.Images.Overview.checkMarkNotDone)
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 3
        return view
    }()
    
    private let title: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 17)
        label.textColor = R.Colors.titleGray
        return label
    }()
    
    private let subTitle: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 13)
        label.textColor = R.Colors.inactive
        return label
    }()
    
    private let rightErrowVeiw = UIImageView(image: R.Images.Overview.rightArrow)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        constraintViews()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        
        setupViews()
        constraintViews()
        configureAppearance()
    }
    
    func configure(title: String, subtitle: String, isDone: Bool) {
        self.title.text = title.uppercased()
        self.subTitle.text = subtitle
        checkMarkView.image = isDone ? R.Images.Overview.checkMarkDone : R.Images.Overview.checkMarkNotDone
    }
}

private extension TrainingCellView {
    func setupViews() {
        setupView(checkMarkView)
        setupView(stackView)
        stackView.addArrangedSubview(title)
        stackView.addArrangedSubview(subTitle)
    
        setupView(rightErrowVeiw)
        
    }
    func constraintViews() {

        NSLayoutConstraint.activate([
            checkMarkView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            checkMarkView.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkMarkView.heightAnchor.constraint(equalToConstant: 28),
            checkMarkView.widthAnchor.constraint(equalTo: checkMarkView.heightAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: checkMarkView.trailingAnchor, constant: 15),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.trailingAnchor.constraint(equalTo: rightErrowVeiw.leadingAnchor, constant:  -15),

            rightErrowVeiw.centerYAnchor.constraint(equalTo: centerYAnchor),
            rightErrowVeiw.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            rightErrowVeiw.heightAnchor.constraint(equalToConstant: 12),
            rightErrowVeiw.widthAnchor.constraint(equalToConstant: 7),
    
        ])
    }
    
    func configureAppearance() {
        backgroundColor = .white
        layer.borderWidth = 1
        layer.borderColor = R.Colors.separator.cgColor
    }
   

}


