//
//  StatisticsVC.swift
//  DrinkTracker
//
//  Created by Juho Alin on 10.1.2021.
//

import UIKit

class StatisticsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureNavController()
    }
    
    func configureNavController() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: K.Icons.calculator, style: .plain, target: self, action: nil)
        navigationController?.navigationBar.tintColor = .label
        title = "Statistics"
    }

    
}
