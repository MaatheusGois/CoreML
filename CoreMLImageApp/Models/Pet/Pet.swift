//
//  Pet.swift
//  CoreMLImageApp
//
//  Created by Matheus Silva on 23/04/20.
//  Copyright © 2020 Tatenda Kabike. All rights reserved.
//

import UIKit


struct Pet {
    let image: UIImage
    
    static func getCollection_01() -> Pets {
        var pets = Pets()
        for index in 1...8 {
            guard let image = UIImage(named: "dog_0\(index)") else {
                fatalError("Image not found")
            }
            pets.append(Pet(image: image))
        }
        return pets
    }
}

typealias Pets = [Pet]


