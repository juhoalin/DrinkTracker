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
    let numberLabel = PromilleLabel()
    let infoLabel = UILabel()
    let addButton = UIButton(type: .custom)
    let infostackView = UIStackView()
    
    let elementPadding: CGFloat = 20
    let innerElementPadding: CGFloat = 20
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureElementView()
        configureNumberLabel()
        configureInfoLabel()
        configureInfoStackView()
        configureAddButton()
        self.contentView.isUserInteractionEnabled = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("Storyboards not supported")
    }
    
    func configure(with container: Container) {
        numberLabel.updateColor(with: container.floatValue ?? 0.0)
        let attString1 = NSMutableAttributedString(string: "\(container.floatValue ?? 0.0) ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 70, weight: .heavy)])
        let attString2 = NSMutableAttributedString(string: "‰", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 50, weight: .bold), NSAttributedString.Key.foregroundColor: UIColor.secondaryLabel])
        attString1.append(attString2)
        numberLabel.attributedText = attString1
    }
    
    func configureElementView() {
        elementView.layer.cornerRadius = 20
        elementView.backgroundColor = .systemGroupedBackground
        elementView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(elementView)
        
        NSLayoutConstraint.activate([
            elementView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: elementPadding),
            elementView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            elementView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -elementPadding),
            elementView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -elementPadding),
        ])
    }
    
    func configureNumberLabel() {
//        numberLabel.font = UIFont.systemFont(ofSize: 45, weight: .heavy)
//        numberLabel.textColor = .label
//        numberLabel.adjustsFontSizeToFitWidth = true
        elementView.addSubview(numberLabel)
    }
    
    func configureInfoLabel() {
        infoLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        infoLabel.textColor = .secondaryLabel
        infoLabel.text = "Estimated Intoxication"
        elementView.addSubview(infoLabel)
    }
    
    func configureInfoStackView() {
        infostackView.addArrangedSubview(numberLabel)
        infostackView.addArrangedSubview(infoLabel)
        infostackView.axis = .vertical
        infostackView.distribution = .fill
        infostackView.translatesAutoresizingMaskIntoConstraints = false
        elementView.addSubview(infostackView)
        
        NSLayoutConstraint.activate([
            infostackView.leadingAnchor.constraint(equalTo: elementView.leadingAnchor, constant: innerElementPadding),
            infostackView.topAnchor.constraint(equalTo: elementView.topAnchor, constant: innerElementPadding),
            infostackView.bottomAnchor.constraint(equalTo: elementView.bottomAnchor, constant: -innerElementPadding),
            infostackView.widthAnchor.constraint(equalTo: elementView.widthAnchor, multiplier: 0.6)
        ])
    }
    
    func configureAddButton() {
        let iconConfig = UIImage.SymbolConfiguration(pointSize: 70, weight: .bold)
        addButton.setImage(UIImage.init(systemName: "plus", withConfiguration: iconConfig), for: .normal)
        addButton.tintColor = .label
        addButton.showsTouchWhenHighlighted = true
        addButton.addTarget(self, action: #selector(addButtonAction), for: .touchUpInside)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        elementView.addSubview(addButton)
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: elementView.topAnchor, constant: innerElementPadding),
            addButton.leadingAnchor.constraint(equalTo: infostackView.trailingAnchor, constant: innerElementPadding),
            addButton.trailingAnchor.constraint(equalTo: elementView.trailingAnchor, constant: -innerElementPadding),
            addButton.bottomAnchor.constraint(equalTo: elementView.bottomAnchor, constant: -innerElementPadding)
        ])
    }
    
    @objc func addButtonAction() {
    
    }
    
}
