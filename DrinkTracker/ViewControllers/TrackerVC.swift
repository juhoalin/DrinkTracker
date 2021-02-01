//
//  DrinkVC.swift
//  DrinkTracker
//
//  Created by Juho Alin on 10.1.2021.
//

import UIKit

class TrackerVC: UIViewController {
    
    var sections = MockData.sections
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Container>?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureNavController()
        configureCollectionView()
        createDataSource()
        reloadData()
    }
    
    func configureNavController() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = .label
        title = "Tracker"
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        
        collectionView.register(PromilleCell.self, forCellWithReuseIdentifier: PromilleCell.reuseIdentifier)
        collectionView.register(StatBoxCell.self, forCellWithReuseIdentifier: StatBoxCell.reuseIdentifier)
        collectionView.register(FriendCell.self, forCellWithReuseIdentifier: FriendCell.reuseIdentifier)
        collectionView.register(ButtonsCell.self, forCellWithReuseIdentifier: ButtonsCell.reuseIdentifier)
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.reuseIdentifier)
    }
    
    
    func configure<T: SelfConfiguringCell>(cellType: T.Type, with container: Container, for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable to deque \(cellType)")
        }
        
        cell.configure(with: container)
        
        return cell
    }
    
    
    func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Container>(collectionView: collectionView) { collectionView, indexPath, container in
            switch self.sections[indexPath.section].type {
            case "statBoxSection":
                return self.configure(cellType: StatBoxCell.self, with: container, for: indexPath)
            case "friendSection":
                return self.configure(cellType: FriendCell.self, with: container, for: indexPath)
            case "buttonsSection":
                return self.configure(cellType: ButtonsCell.self, with: container, for: indexPath)
            default:
                return self.configure(cellType: PromilleCell.self, with: container, for: indexPath)
            }
        }
        
        dataSource?.supplementaryViewProvider = { [weak self] collectionView, kind, indexPath in
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.reuseIdentifier, for: indexPath) as? SectionHeader else {
                return nil
            }
            
            guard let firstApp = self?.dataSource?.itemIdentifier(for: indexPath) else {
                return nil
            }
            
            guard let section = self?.dataSource?.snapshot().sectionIdentifier(containingItem: firstApp) else {
                return nil
            }
             
            if section.title.isEmpty {
                return nil
            }
            
            sectionHeader.title.text = section.title
            
            return sectionHeader
        }

    }
    
    func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Container>()
        snapshot.appendSections(self.sections)
        
        for section in sections {
            snapshot.appendItems(section.containers, toSection: section)
        }
        
        dataSource?.apply(snapshot)
    }
    
    func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            let section = self.sections[sectionIndex]
            switch section.type {
            case "statBoxSection":
                return self.createStatBoxSection(using: section)
            case "friendSection":
                return self.createFriendSection(using: section)
            case "buttonsSection":
                return self.createButtonsSection(using: section)
            default:
                return self.createPromilleSection(using: section)
            }
        }
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 0
        layout.configuration = config
        return layout
    }
    
    func createPromilleSection(using section: Section) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(180))
        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: layoutGroupSize, subitems: [layoutItem])
        
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.orthogonalScrollingBehavior = .groupPagingCentered
        layoutSection.boundarySupplementaryItems = [createSectionHeader()]
        
        return layoutSection
    }
    
    
    func createStatBoxSection(using section: Section) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.473), heightDimension: .estimated(180))
        let layoutGroupt = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [layoutItem])
        layoutGroupt.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20)
                
        let layoutSection = NSCollectionLayoutSection(group: layoutGroupt)
        layoutSection.orthogonalScrollingBehavior = .groupPaging
        layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
        
        
        return layoutSection
    }
    
    func createFriendSection(using section: Section) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.3))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .estimated (250))
        let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: layoutItem, count: 2)
        layoutGroup.interItemSpacing = NSCollectionLayoutSpacing.fixed(20)
        layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10)

        
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        layoutSection.orthogonalScrollingBehavior = .groupPaging
        layoutSection.boundarySupplementaryItems = [createSectionHeader()]
        
        return layoutSection
        
    }
    
    func createButtonsSection(using section: Section) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(100))
        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: layoutGroupSize, subitems: [layoutItem])
                
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0)
        return layoutSection
    }
    
    func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93), heightDimension: .estimated(80))
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        
        return layoutSectionHeader
    }
    
}
