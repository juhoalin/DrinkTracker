//
//  ChartView.swift
//  DrinkTracker
//
//  Created by Juho Alin on 1.2.2021.
//

import UIKit
import Charts

class ChartView: UIView, ChartViewDelegate {
    
    let label = UILabel()
    
    lazy var lineChartView: LineChartView = {
        let chartView = LineChartView()
        chartView.backgroundColor = .systemGroupedBackground
        chartView.dragEnabled = false
        chartView.rightAxis.enabled = false
        chartView.drawGridBackgroundEnabled = false
        chartView.legend.enabled = false
        chartView.setVisibleXRangeMaximum(5)
    
        
        let yAxis = chartView.leftAxis
        yAxis.labelFont = UIFont.systemFont(ofSize: 12, weight: .semibold)
        yAxis.labelPosition = .outsideChart
        yAxis.labelTextColor = .secondaryLabel
        yAxis.axisLineColor = .systemBlue
        yAxis.enabled = false
        yAxis.axisLineWidth = 0.0
        yAxis.drawGridLinesEnabled = false
        
        
        let xAxis = chartView.xAxis
        xAxis.labelFont = UIFont.systemFont(ofSize: 14, weight: .semibold)
        xAxis.labelPosition = .bottom
        xAxis.labelTextColor = .secondaryLabel
        xAxis.drawGridLinesEnabled = false
        xAxis.axisLineWidth = 0.0
        xAxis.avoidFirstLastClippingEnabled = true
        xAxis.axisMaxLabels = 3
        
        
        chartView.animate(yAxisDuration: 2)
        
        chartView.pinchZoomEnabled = false
        chartView.doubleTapToZoomEnabled = false
        
        return chartView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 18
        lineChartView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(lineChartView)
        
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Progress"
        addSubview(label)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.heightAnchor.constraint(equalToConstant: 25),
            
            lineChartView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            lineChartView.topAnchor.constraint(equalTo: self.label.bottomAnchor),
            lineChartView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            lineChartView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            
        ])
        
        setData()
    }
    
    init(bc: UIColor) {
        super.init(frame: .zero)
        self.backgroundColor = bc
    }
    
    required init?(coder: NSCoder) {
        fatalError("No Storyboards")
    }
    
    func setData() {
        let set1 = LineChartDataSet(entries: MockData.statValues, label: nil)
        set1.drawCirclesEnabled = false
        set1.valueFont = UIFont.systemFont(ofSize: 12, weight: .medium)
        set1.valueColors = [.secondaryLabel]
        set1.mode = .linear
        set1.lineWidth = 3.3
        set1.setColor(.systemBlue)
        set1.label = ""
        set1.highlightEnabled = true
        set1.lineCapType = .round
        set1.lineDashPhase = 1.0
        
        
        
        
        let data = LineChartData(dataSet: set1)
        data.setDrawValues(false)
    
        
        
        lineChartView.data = data
        //ineChartView.xAxis.labelCount = 10
    
    }
    
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }
    

}
