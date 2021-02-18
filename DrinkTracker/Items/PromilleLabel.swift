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
            textColor = #colorLiteral(red: 0, green: 0.6945462823, blue: 0.3402124643, alpha: 1)
        case 0.5..<1.5:
            textColor = #colorLiteral(red: 1, green: 0.5915690064, blue: 0, alpha: 1)
        case 1.5..<2.5:
            textColor = #colorLiteral(red: 0.895187676, green: 0.2828083038, blue: 0, alpha: 1)
        default:
            textColor = #colorLiteral(red: 0.8189412951, green: 0.1537796855, blue: 0.1175208464, alpha: 1)

            
        }
    }

}
