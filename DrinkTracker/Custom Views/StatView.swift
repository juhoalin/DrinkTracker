//
//  StatView.swift
//  DrinkTracker
//
//  Created by Juho Alin on 2.2.2021.
//

import UIKit

class StatView: UIView {
    
    let portionTitle = UILabel()
    let drinkTitle = UILabel()
    let portionDesc = UILabel()
    let drinkDesc = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("No Storyboards")
    }
    
    func configureElements() {
        
    }
    
}
