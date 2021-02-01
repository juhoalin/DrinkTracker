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
    let desc = UILabel()
    let numberOfDrinks = UILabel()
    
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
        let toInt = Int(container.floatValue ?? 0.0)
        createNumberOfDrinkLabel(drinks: toInt, str: container.stringValue)
        
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
    
    func createNumberOfDrinkLabel(drinks: Int?, str: String?) {
        desc.text = str
        desc.font = .preferredFont(forTextStyle: .headline)
        desc.textColor = .secondaryLabel
        desc.textAlignment = .center
        numberOfDrinks.font = UIFont.systemFont(ofSize: 70, weight: .bold)
        numberOfDrinks.adjustsFontSizeToFitWidth = true
        numberOfDrinks.textColor = .label
        numberOfDrinks.text = "\(drinks ?? 0)"
        numberOfDrinks.textAlignment = .center
        
        let stackView = UIStackView(arrangedSubviews: [numberOfDrinks, desc])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        elementView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: elementView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: elementView.centerYAnchor),
            stackView.heightAnchor.constraint(lessThanOrEqualTo: elementView.heightAnchor, multiplier: 0.80),
            stackView.widthAnchor.constraint(lessThanOrEqualTo: elementView.widthAnchor, multiplier: 0.80),

        ])
        
    }
    
}
