//
//  SliderViewController.swift
//  SwipeLetters
//
//  Created by Glenn Posadas on 1/21/21.
//

import UIKit

class SliderViewController: BaseViewController {

    // MARK: - Properties
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Overrides
    // MARK: Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDelegate

extension SliderViewController: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension SliderViewController: UICollectionViewDelegateFlowLayout {
    
}

// MARK: - UICollectionViewDataSource

extension SliderViewController: UICollectionViewDataSource {
    
}
