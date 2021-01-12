//
//  SelfConfiguringCell.swift
//  DrinkTracker
//
//  Created by Juho Alin on 12.1.2021.
//

import UIKit

protocol SelfConfiguringCell {
    
    static var reuseIdentifier: String { get }
    func configure(with container: Container)
    
}
