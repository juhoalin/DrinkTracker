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
        separatator.backgroundColor = .quaternaryLabel
        
        title.textColor = .secondaryLabel
        title.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 28, weight: .bold))
        
        let stackView = UIStackView(arrangedSubviews: [title])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            separatator.heightAnchor.constraint(equalToConstant: 1),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        stackView.setCustomSpacing(10, after: separatator)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
}
