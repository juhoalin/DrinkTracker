//
//  SectionHeader.swift
//  DrinkTracker
//
//  Created by Juho Alin on 12.1.2021.
//

import UIKit

class SectionHeader: UICollectionReusableView {
    
    static let reuseIdentifier = "SectionHeader"
    
    let title = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let separatator = UIView(frame: .zero)
        separatator.translatesAutoresizingMaskIntoConstraints = false
        separatator.backgroundColor = .systemBackground
        
        let separator2 = UIView(frame: .zero)
        separator2.translatesAutoresizingMaskIntoConstraints = false
        separatator.backgroundColor = .systemBackground
        
        title.textColor = .label
        title.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 28, weight: .bold))
        
        let stackView = UIStackView(arrangedSubviews: [separatator, title, separator2])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            separatator.heightAnchor.constraint(equalToConstant: 1),
            separator2.heightAnchor.constraint(equalToConstant: 1),
            
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        stackView.setCustomSpacing(15, after: separatator)
        stackView.setCustomSpacing(5, after: title)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
}
