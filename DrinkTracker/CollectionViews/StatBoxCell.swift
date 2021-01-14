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
    
    let elementPadding: CGFloat = 20
    let innerPadding: CGFloat = 10
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureElementView()
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
        contentView.addSubview(elementView)
        
        NSLayoutConstraint.activate([
            elementView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            elementView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            elementView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            elementView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -elementPadding),

        ])
    }
    
    
}
