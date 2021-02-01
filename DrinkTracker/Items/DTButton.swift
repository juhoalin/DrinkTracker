//
//  DTButton.swift
//  DrinkTracker
//
//  Created by Juho Alin on 29.1.2021.
//

import UIKit

class DTButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(backgroundColor: UIColor?, textColor: UIColor?) {
        super.init(frame: .zero)
        configure(backroundColor: backgroundColor, textColor: textColor)
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("No")
    }
    
    func configure(backroundColor: UIColor?, textColor: UIColor?) {
        backgroundColor = backroundColor
        titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        setTitleColor(textColor, for: .normal)
        layer.cornerRadius = 18
        translatesAutoresizingMaskIntoConstraints = false
        showsTouchWhenHighlighted = true
        
        
        
    }
    

}
