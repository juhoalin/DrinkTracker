//
//  FriendCell.swift
//  DrinkTracker
//
//  Created by Juho Alin on 26.1.2021.
//

import UIKit

class FriendCell: UICollectionViewCell, SelfConfiguringCell {

    static var  reuseIdentifier = "FriendCell"
    
    let circle = UIView()
    let promillelabel = PromilleLabel()
    let nameLabel = UILabel()
    
    let elementPadding: CGFloat = 20
    let innerPadding: CGFloat = 10
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("No")
    }
    
    func configure(with container: Container) {
        let toString = String(container.floatValue ?? 0.0)
        configureElements()
        promillelabel.text = toString
        promillelabel.updateColor(with: container.floatValue ?? 0.0)
        nameLabel.text = container.stringValue ?? "Friend"
    }
    
    func configureElements() {
        circle.layer.cornerRadius = 85 / 2
        circle.backgroundColor = .systemGroupedBackground
        circle.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(circle)
        
        promillelabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        promillelabel.textColor = .label
        promillelabel.adjustsFontSizeToFitWidth = true
        promillelabel.translatesAutoresizingMaskIntoConstraints = false
        circle.addSubview(promillelabel)
        
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.font = .preferredFont(forTextStyle: .headline)
        nameLabel.textColor = .secondaryLabel
        nameLabel.contentMode = .top
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)
        
                
        NSLayoutConstraint.activate([
            
            circle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: innerPadding),
            circle.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            circle.heightAnchor.constraint(equalToConstant: 85),
            circle.widthAnchor.constraint(equalToConstant: 85),
        
            promillelabel.centerYAnchor.constraint(equalTo: circle.centerYAnchor),
            promillelabel.centerXAnchor.constraint(equalTo: circle.centerXAnchor),
            
            nameLabel.centerXAnchor.constraint(equalTo: circle.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: circle.bottomAnchor, constant: 2),
            
        ])

    }
    
    
}
