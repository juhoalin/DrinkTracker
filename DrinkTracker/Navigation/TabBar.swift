//
//  TabBarViewController.swift
//  DrinkTracker
//
//  Created by Juho Alin on 9.1.2021.
//

import UIKit

let home = UITabBarItem(title: nil, image: K.Icons.home, selectedImage: K.Icons.homeFilled)
let chart = UITabBarItem(title: nil, image: K.Icons.chart, selectedImage: K.Icons.chartFilled)
let person = UITabBarItem(title: nil, image: K.Icons.person, selectedImage: K.Icons.personFilled)

class TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
    }
    

    func createDrinkVC() -> UINavigationController {
        let vc = TrackerVC()
        vc.tabBarItem = home
        return UINavigationController(rootViewController: vc)
    }
    
    func createStatisticsVC() -> UINavigationController {
        let statVC = StatisticsVC()
        statVC.tabBarItem = chart
        return UINavigationController(rootViewController: statVC)
    }
    
    func createSettingsVC() -> UINavigationController {
        let  setVC = SettingsVC()
        setVC.tabBarItem = person
        return UINavigationController(rootViewController: setVC)
    }
    
    func configureTabBar() {
        viewControllers = [createDrinkVC(), createStatisticsVC(), createSettingsVC()]
        tabBar.tintColor = .black
    }
    

}

//MARK: - Preview


import SwiftUI

struct AppPreview: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<AppPreview.ContainerView>) -> UIViewController {
            return TabBar()
        }
        
        func updateUIViewController(_ uiViewController: AppPreview.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<AppPreview.ContainerView>) {
        }
    }
    
}


