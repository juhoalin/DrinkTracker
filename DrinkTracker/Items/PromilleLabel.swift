//
//  ColorChangeLabel.swift
//  DrinkTracker
//
//  Created by Juho Alin on 28.1.2021.
//

import UIKit

class PromilleLabel: UILabel {
    
    var promille: Float = 0.0

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
        
    required init?(coder: NSCoder) {
        fatalError("fuuk")
    }
        
    func configure() {
        adjustsFontSizeToFitWidth = true
        lineBreakMode = .byTruncatingTail
    }
    
    func updateColor(with promille: Float) {
        self.promille = promille
        switch self.promille {
        case 0...0.4:
            textColor = .systemGreen
        case 0.5..<1.5:
            textColor = .systemOrange
        case 1.5..<2.5:
            textColor = .systemPink
        default:
            textColor = .systemRed
        }
    }

}
