//
//  ChartView.swift
//  FeetnessApp
//
//  Created by Руслан Новиков on 3.01.25.
//


import UIKit

final class ChartView: WABaseView {
    private let yAxisSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = R.Colors.separator
        return view
    }()
    
    private let xAxisSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = R.Colors.separator
        return view
    }()
    
    func configure(with data: [WAChartsView.Data]) {
        layoutIfNeeded()
        drawDashLines()
        drawChart(with: data, topChartOffset: 10)
    }
}

extension ChartView {
    override func setupViews() {
        super.setupViews()

        setupView(yAxisSeparator)
        setupView(xAxisSeparator)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            yAxisSeparator.topAnchor.constraint(equalTo: topAnchor),
            yAxisSeparator.widthAnchor.constraint(equalToConstant: 1),
            yAxisSeparator.leadingAnchor.constraint(equalTo: leadingAnchor),
            yAxisSeparator.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            xAxisSeparator.heightAnchor.constraint(equalToConstant: 1),
            xAxisSeparator.trailingAnchor.constraint(equalTo: trailingAnchor),
            xAxisSeparator.leadingAnchor.constraint(equalTo: leadingAnchor),
            xAxisSeparator.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        backgroundColor = .clear
    }
}

private extension ChartView {
    func drawDashLines(with counts: Int = 9) {
        (0..<counts).map { CGFloat($0) }.forEach {
            drawDashLine(at: bounds.height / CGFloat(counts) * $0)
        }
    }

    func drawDashLine(at yPosition: CGFloat) {
        let startPoint = CGPoint(x: 0, y: yPosition)
        let endPoint = CGPoint(x: bounds.width, y: yPosition)

        let dashPath = CGMutablePath()
        dashPath.addLines(between: [startPoint, endPoint])

        let dashLayer = CAShapeLayer()
        dashLayer.path = dashPath
        dashLayer.strokeColor = R.Colors.separator.cgColor
        dashLayer.lineWidth = 1
        dashLayer.lineDashPattern = [6, 3]

        layer.addSublayer(dashLayer)
    }

    func drawChart(with data: [WAChartsView.Data], topChartOffset: Int) {
        guard let maxValue = data.sorted(by: { $0.value > $1.value }).first?.value else { return }
        let valuePoints = data.enumerated().map { CGPoint(x: CGFloat($0), y: CGFloat($1.value)) }
        let chartHeight = bounds.height / CGFloat(maxValue + topChartOffset)

        let points = valuePoints.map {
            let x = bounds.width / CGFloat(valuePoints.count - 1) * $0.x
            let y = bounds.height - $0.y * chartHeight
            return CGPoint(x: x, y: y)
        }

        let chartPath = UIBezierPath()
        chartPath.move(to: points[0])

        points.forEach {
            chartPath.addLine(to: $0)
            drawChartDot(at: $0)
        }

        let chartLayer = CAShapeLayer()
        chartLayer.path = chartPath.cgPath
        chartLayer.fillColor = UIColor.clear.cgColor
        chartLayer.strokeColor = R.Colors.active.cgColor
        chartLayer.lineWidth = 3
        chartLayer.strokeEnd = 1 // на сколько процентов отрисована линиия(1 = 100)
        chartLayer.lineJoin = .round

        layer.addSublayer(chartLayer)
    }

    func drawChartDot(at point: CGPoint) {
        let dotPath = UIBezierPath()
        dotPath.move(to: point)
        dotPath.addLine(to: point)

        let dotLayer = CAShapeLayer()
        dotLayer.path = dotPath.cgPath
        dotLayer.strokeColor = R.Colors.active.cgColor
        dotLayer.lineCap = .round
        dotLayer.lineWidth = 10

        layer.addSublayer(dotLayer)
    }
}

