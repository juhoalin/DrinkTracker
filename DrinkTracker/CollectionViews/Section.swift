//
//  Section.swift
//  DrinkTracker
//
//  Created by Juho Alin on 12.1.2021.
//

import Foundation

struct Section: Hashable {
    let orderID: Int
    let type: String
    let title: String
    let containers: [Container]
}
