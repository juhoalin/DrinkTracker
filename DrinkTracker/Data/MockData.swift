//
//  MockData.swift
//  DrinkTracker
//
//  Created by Juho Alin on 29.1.2021.
//

import UIKit
import Charts

struct MockData {
        
    static var sections = [
        Section(id: 1, type: "promilleSection", title: "You", containers: [Container(id: 0, floatValue: 0.7, stringValue: nil, customView: nil)]),
        
        Section(id: 2, type: "chartSection", title: "Stats", containers: [
            Container(id: 1, floatValue: nil, stringValue: nil, customView: ChartView()),
            Container(id: 2, floatValue: nil, stringValue: nil, customView: ChartView()),
        ]),
        
        Section(id: 3, type: "friendSection", title: "Friends", containers: [
            Container(id: 3, floatValue: 0.9, stringValue: "Jack", customView: nil),
            Container(id: 4, floatValue: 3.2, stringValue: "Haley", customView: nil),
            Container(id: 5, floatValue: 0.1, stringValue: "Pussy", customView: nil),
            Container(id: 6, floatValue: 2.1, stringValue: "Beta", customView: nil),
            Container(id: 7, floatValue: 4.5, stringValue: "Chad", customView: nil),
            Container(id: 8, floatValue: 0.4, stringValue: "Karen", customView: nil),
            Container(id: 9, floatValue: 0.6, stringValue: "Ubert", customView: nil)
        ]),
        
        Section(id: 4, type: "buttonsSection", title: "   ", containers: [
            Container(id: 10, floatValue: nil, stringValue: nil, customView: nil)
        ])

    ]
    
    static var statValues: [ChartDataEntry] = [
        ChartDataEntry(x: 18.00, y: 0.0),
        ChartDataEntry(x: 19.00, y: 0.4),
        ChartDataEntry(x: 20.00, y: 0.78),
        ChartDataEntry(x: 20.30, y: 0.99),
        ChartDataEntry(x: 22.00, y: 0.85),
        ChartDataEntry(x: 23.00, y: 1.30),
        ChartDataEntry(x: 24.00, y: 0.80)
    ]
    
}
