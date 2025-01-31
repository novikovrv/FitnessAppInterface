//
//  ProgressController.swift
//  FeetnessApp
//
//  Created by Руслан Новиков on 15.12.24.
//

import UIKit

class ProgressController: BaseController {
    private let dailyPerformanceView = DailyPerformanceView(
        with: R.Strings.Progress.dailyPerformance,
        buttonTitle: R.Strings.Progress.last7Days)
    
    private let monthlyPerformanceView = MonthlyPerformanceView(
        with: R.Strings.Progress.monthlyPerformance,
        buttonTitle: R.Strings.Progress.last10Month)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = R.Strings.NavBar.progress
        navigationController?.tabBarItem.title = R.Strings.TabBar.title(for: .progress)
        
        addNuvButton(at: .left, with: R.Strings.Progress.navBarLeft)
        addNuvButton(at: .right, with: R.Strings.Progress.navBarRight)
    }
}

extension ProgressController {
    override func setupViews() {
        super.setupViews()
        
        view.setupView(dailyPerformanceView)
        view.setupView(monthlyPerformanceView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            dailyPerformanceView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            dailyPerformanceView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            dailyPerformanceView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            dailyPerformanceView.heightAnchor.constraint(equalTo: dailyPerformanceView.widthAnchor, multiplier: 0.68),
            
            monthlyPerformanceView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            monthlyPerformanceView.topAnchor.constraint(equalTo: dailyPerformanceView.bottomAnchor, constant: 15),
            monthlyPerformanceView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            monthlyPerformanceView.heightAnchor.constraint(equalTo: monthlyPerformanceView.widthAnchor, multiplier: 1.06),
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
    
        dailyPerformanceView.configure(with: [.init(value: "1", heightMultiplayer: 0.2, title: "MON"),
                                   .init(value: "2", heightMultiplayer: 0.4, title: "TUE"),
                                   .init(value: "3", heightMultiplayer: 0.6, title: "WEN"),
                                   .init(value: "4", heightMultiplayer: 0.8, title: "THU"),
                                   .init(value: "5", heightMultiplayer: 1, title: "FRI"),
                                   .init(value: "3", heightMultiplayer: 0.6, title: "SET"),
                                   .init(value: "2", heightMultiplayer: 0.4, title: "SUN"),
                                  ])
        
        monthlyPerformanceView.configure(with: [.init(value: 45, title: "MAR"),
                                                .init(value: 55, title: "APR"),
                                                .init(value: 60, title: "MAY"),
                                                .init(value: 65, title: "MAY"),
                                                .init(value: 65, title: "MAY"),
                                                .init(value: 65, title: "MAY"),
                                                .init(value: 65, title: "MAY"),
                                                .init(value: 65, title: "MAY"),
                                                .init(value: 65, title: "MON"),
                                                .init(value: 65, title: "MON")])
    }
}

