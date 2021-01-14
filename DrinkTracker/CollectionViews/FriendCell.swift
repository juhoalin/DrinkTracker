//
//  FriendCell.swift
//  DrinkTracker
//
//  Created by Juho Alin on 14.1.2021.
//

import UIKit

class FriendCell: UICollectionViewCell {
    
    let circle = UIView()
    let promilleLabel = UILabel()
    let nameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Storyboard not supported")
    }
    
    
    
}
