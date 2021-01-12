//
//  StatBoxCell.swift
//  DrinkTracker
//
//  Created by Juho Alin on 13.1.2021.
//

import UIKit

class StatBoxCell: UICollectionViewCell, SelfConfiguringCell {
    
    static var reuseIdentifier: String = "StatBoxCell"
    
    let elementView = UIView()
    
    let elementPadding = 20
    let innerPadding = 10
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Cant use Storyboards")
    }
    
    func configure(with container: Container) {
        
    }
    
    func configureElementView() {
        elementView.layer.cornerRadius = 20
        elementView.backgroundColor = .systemGroupedBackground
        elementView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
        ])
    }
    
    
}
