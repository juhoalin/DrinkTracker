//
//  PromilleCell.swift
//  DrinkTracker
//
//  Created by Juho Alin on 12.1.2021.
//

import UIKit

class PromilleCell: UICollectionViewCell, SelfConfiguringCell {
    
    static var reuseIdentifier: String = "PromilleCell"
    
    let elementView = UIView()
    let numberLabel = UILabel()
    let infoLabel = UILabel()
    let addButton = UIButton(type: .custom)
    
    let elementPadding: CGFloat = 20
    let innerElementPadding: CGFloat = 20
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureElementView()
        configureNumberLabel()
        configureInfoLabel()
        configureAddButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Storyboards not supported")
    }
    
    func configure(with container: Container) {
        numberLabel.text = "\(container.floatValue ?? 0.0)‰"
    }
    
    func configureElementView() {
        elementView.layer.cornerRadius = 20
        elementView.backgroundColor = .systemGroupedBackground
        elementView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(elementView)
        
        NSLayoutConstraint.activate([
            elementView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: elementPadding),
            elementView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: elementPadding),
            elementView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -elementPadding),
            elementView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -elementPadding),
        ])
    }
    
    func configureNumberLabel() {
        numberLabel.font = UIFont.systemFont(ofSize: 45, weight: .bold)
        numberLabel.textColor = .label
        numberLabel.adjustsFontSizeToFitWidth = true
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        elementView.addSubview(numberLabel)
        
        numberLabel.backgroundColor = .systemBlue
        numberLabel.text = "Test"
        
        NSLayoutConstraint.activate([
            numberLabel.leadingAnchor.constraint(equalTo: elementView.leadingAnchor, constant: innerElementPadding),
            numberLabel.topAnchor.constraint(equalTo: elementView.topAnchor, constant: innerElementPadding),
            numberLabel.widthAnchor.constraint(equalToConstant: 150),
            numberLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func configureInfoLabel() {
        infoLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        infoLabel.textColor = .secondaryLabel
        infoLabel.text = "Estimated Intoxication"
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        elementView.addSubview(infoLabel)
        
        infoLabel.backgroundColor = .systemGreen
        
        NSLayoutConstraint.activate([
            infoLabel.leadingAnchor.constraint(equalTo: elementView.leadingAnchor, constant: innerElementPadding),
            infoLabel.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: innerElementPadding),
            infoLabel.bottomAnchor.constraint(equalTo: elementView.bottomAnchor, constant: -innerElementPadding),
            infoLabel.trailingAnchor.constraint(equalTo: numberLabel.trailingAnchor)
        ])
    }
    
    func configureAddButton() {
        let iconConfig = UIImage.SymbolConfiguration(pointSize: 50, weight: .bold)
        addButton.setImage(UIImage.init(systemName: "plus", withConfiguration: iconConfig), for: .normal)
        addButton.tintColor = .label
        addButton.contentVerticalAlignment = .fill
        addButton.contentHorizontalAlignment = .fill
        addButton.translatesAutoresizingMaskIntoConstraints = false
        elementView.addSubview(addButton)
        
        NSLayoutConstraint.activate([
            addButton.centerYAnchor.constraint(equalTo: elementView.centerYAnchor),
            addButton.heightAnchor.constraint(equalToConstant: 100),
            addButton.trailingAnchor.constraint(equalTo: elementView.trailingAnchor, constant: -innerElementPadding),
            addButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
}
