//
//  PetDataSource.swift
//  CoreMLImageApp
//
//  Created by Matheus Silva on 23/04/20.
//  Copyright © 2020 Tatenda Kabike. All rights reserved.
//

import UIKit

class PetDataSource: NSObject, UICollectionViewDataSource {
    var pets = Pet.getCollection_01()

    weak var viewController: UIViewController?

    func setup(collectionView: UICollectionView, viewController: UIViewController) {
        self.viewController = viewController
        collectionView.dataSource = self
        register(collectionView: collectionView)
    }
    internal func register(collectionView: UICollectionView) {
        let cell = UINib(nibName: "PetCell", bundle: nil)
        collectionView.register(cell, forCellWithReuseIdentifier: "PetCell")
    }

    internal func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pets.count
    }

    internal func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PetCell",
                                                         for: indexPath) as? PetCell {
            let pet = pets[indexPath.row]
            cell.petImage.image = pet.image
            cell.cornerRadiusV = 20
            return cell
        }
        return UICollectionViewCell()
    }
}
