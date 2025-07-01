//
//  UICollectionViewLayout + Extension.swift
//  CollectionView
//
//  Created by 김정윤 on 7/1/25.
//

import UIKit

extension UICollectionViewLayout {
    static func someLayout() -> UICollectionViewLayout {
        let spacing: CGFloat = 8
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.25))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(spacing)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = spacing
        section.contentInsets = .init(top: 0, leading: spacing, bottom: 0, trailing: spacing)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    // UICollectionViewListConfiguration
    static func cookieLayout() -> UICollectionViewLayout {
        var config = UICollectionLayoutListConfiguration(appearance: .plain)
        config.showsSeparators = false
        config.backgroundColor = .systemGray6
        let layout = UICollectionViewCompositionalLayout.list(using: config)
        return layout
    }
}
