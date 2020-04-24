//
//  UIImage.swift
//  CoreMLImageApp
//
//  Created by Matheus Silva on 23/04/20.
//  Copyright © 2020 Tatenda Kabike. All rights

import UIKit

extension UIImage {
    var cgImageOrientation : CGImagePropertyOrientation
    {
        switch imageOrientation {
            case .up: return .up
            case .upMirrored: return .upMirrored
            case .down: return .down
            case .downMirrored: return .downMirrored
            case .leftMirrored: return .leftMirrored
            case .right: return .right
            case .rightMirrored: return .rightMirrored
            case .left: return .left
            default: return.up
            
        }
    }
}
