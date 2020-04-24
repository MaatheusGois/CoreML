//
//  PetDelegate.swift
//  CoreMLImageApp
//
//  Created by Matheus Silva on 23/04/20.
//  Copyright © 2020 Tatenda Kabike. All rights reserved.
//

import UIKit

class PetDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    var pets = Pet.getCollection_01()
    weak var viewController: ViewController?

    func setup(collectionView: UICollectionView, viewController: ViewController) {
        collectionView.delegate = self
        self.viewController = viewController
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets (top: 0, left: 20, bottom: 0, right: 20)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: Double = Double(collectionView.frame.width) * 0.67733333334
        let width: Double = Double(collectionView.frame.width) * 0.46666666667
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? PetCell {
            toDetail(row: indexPath.row, image: cell.petImage.image)
        }
    }

    @objc
    func toDetail(row: Int, image: UIImage?) {
        self.viewController?.loadImage(image: image)
    }
}
