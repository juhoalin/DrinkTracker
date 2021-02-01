//
//  ChartCell.swift
//  DrinkTracker
//
//  Created by Juho Alin on 1.2.2021.
//

import UIKit

class ChartCell: UICollectionViewCell, SelfConfiguringCell {
    
    static var reuseIdentifier: String = "chartCell"
    
    let containerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureParentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("No Storyboard")
    }
    
    func configure(with container: Container) {
        let statView = container.customView ?? UIView()
        statView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(statView)
        
        NSLayoutConstraint.activate([
            statView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            statView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            statView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            statView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),

        ])
        
    }
    
    func configureParentView() {
        containerView.layer.cornerRadius = 21
        containerView.backgroundColor = .systemGroupedBackground
        containerView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
        ])
        
    }
    
}
