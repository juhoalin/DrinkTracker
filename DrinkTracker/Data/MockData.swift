//
//  MockData.swift
//  DrinkTracker
//
//  Created by Juho Alin on 29.1.2021.
//

import Foundation

struct MockData {
    
    
    
    static var sections = [
        Section(id: 1, type: "promilleSection", title: "You", containers: [Container(id: 0, floatValue: 0.7, stringValue: nil, customView: nil), Container(id: 1, floatValue: nil, stringValue: nil, customView: nil)]),
        
        Section(id: 2, type: "statBoxSection", title: "Stats", containers: [
            Container(id: 2, floatValue: 12, stringValue: "Drinks", customView: nil),
            Container(id: 3, floatValue: 8, stringValue: "Hours till Sober", customView: nil),
            Container(id: 4, floatValue: 69, stringValue: "Grams", customView: nil),
            Container(id: 5, floatValue: 845, stringValue: "Calories", customView: nil)
        ]),
        
        Section(id: 3, type: "friendSection", title: "Friends", containers: [
            Container(id: 6, floatValue: 0.9, stringValue: "Jack", customView: nil),
            Container(id: 7, floatValue: 3.2, stringValue: "Haley", customView: nil),
            Container(id: 8, floatValue: 0.1, stringValue: "Pussy", customView: nil),
            Container(id: 9, floatValue: 2.1, stringValue: "Beta", customView: nil),
            Container(id: 10, floatValue: 4.5, stringValue: "Chad", customView: nil),
            Container(id: 11, floatValue: 0.4, stringValue: "Karen", customView: nil),
            Container(id: 12, floatValue: 0.6, stringValue: "Ubert", customView: nil)
        ]),
        
        Section(id: 4, type: "buttonsSection", title: "   ", containers: [
            Container(id: 13, floatValue: nil, stringValue: nil, customView: nil)
        ])

    ]
    
}
