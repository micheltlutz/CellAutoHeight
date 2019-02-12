//
//  CollectionTesteViewController.swift
//  AutoSizeTests
//
//  Created by Michel Anderson Lutz Teixeira on 12/02/19.
//  Copyright © 2019 Michel Anderson Lutz Teixeira. All rights reserved.
//

import UIKit

class CollectionTesteViewController: UIViewController {
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cellSize = CGSize(width: ScreenManager.screenWidth(), height: 120)
        layout.itemSize = cellSize
        layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        layout.minimumLineSpacing = 8.0
        layout.minimumInteritemSpacing = 8.0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        return collectionView
    }()
}
