//
//  ButtonsCell.swift
//  DrinkTracker
//
//  Created by Juho Alin on 29.1.2021.
//

import UIKit

class ButtonsCell: UICollectionViewCell, SelfConfiguringCell {
    
    static var reuseIdentifier: String = "ButtonsCell"
    
    let inviteButton = UIButton(type: .system)
    let endButton = UIButton(type: .system)
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("No")
    }
    
    func configure(with container: Container) {
        endButton.layer.cornerRadius = endButton.frame.height / 3.5
        inviteButton.layer.cornerRadius = inviteButton.frame.height / 3.5
    }
    
    func configureButtons() {
        inviteButton.setTitle("Invite Friends", for: .normal)
        inviteButton.titleLabel?.textAlignment = .center
        inviteButton.backgroundColor = .systemGroupedBackground
        inviteButton.setTitleColor(.secondaryLabel, for: .normal)
        inviteButton.clipsToBounds = true
        inviteButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)

        
        endButton.setTitle("End Session", for: .normal)
        endButton.setTitleColor(.systemBackground, for: .normal)
        endButton.titleLabel?.textAlignment = .center
        endButton.backgroundColor = UIColor.systemPink.withAlphaComponent(0.7)
        endButton.clipsToBounds = true
        endButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)

        
        let stackView = UIStackView(arrangedSubviews: [inviteButton, endButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            inviteButton.heightAnchor.constraint(equalToConstant: 50),
            endButton.heightAnchor.constraint(equalToConstant: 50),
            
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
        ])
        
    }
    
    
}
