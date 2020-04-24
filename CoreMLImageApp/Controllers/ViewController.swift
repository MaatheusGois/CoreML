//
//  ViewController.swift
//  CoreMLImageApp
//
//  Created by Tatenda Kabike on 2019/12/13.
//  Copyright © 2019 Tatenda Kabike. All rights reserved.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var petDataSource = PetDataSource()
    var petDelegate   = PetDelegate()
    
    let pets = {
        return Pet.getCollection_01()
    }
    
    let modelFile = SqueezeNet()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    func setUp() {
        
        loadImage(image: pets()[0].image)
        petDataSource.setup(collectionView: collectionView, viewController: self)
        petDelegate.setup(collectionView: collectionView, viewController: self)
    }
    
    
    func loadImage(image: UIImage?) {
        imageView.image = image
        
        guard let image = image, let cgImage = image.cgImage else {
            return
        }
        
        do {
            let model = try VNCoreMLModel(for: modelFile.model)
            //Requesting image to examine
            let handler = VNImageRequestHandler(cgImage: cgImage,
                                                orientation: image.cgImageOrientation,
                                                options: [:])
            
            //Examine the image and compare to trained data inside the Core ML model
            let request = VNCoreMLRequest(model: model,
                                          completionHandler: findResults)
            try handler.perform([request])
        } catch {
            fatalError(error.localizedDescription)
        }
        
    }
    
    func findResults(request: VNRequest, error: Error?){
        guard var results = request.results as? [VNClassificationObservation] else {
            fatalError("Unable to get results")
        }
        
        results.sort(by: {$0.confidence > $1.confidence})
        descriptionLabel.text = "Image is: \(results[0].identifier)\n With confidence level of \(results[0].confidence) out of 1"
    }
}

