/*
 *	MockCameraController.swift
 *	WorldStats
 *
 *	Created by Muhammad Fahied on 8/28/20.
 *	Copyright 2020 Fahied. All rights reserved.
 */

import UIKit

class MockCameraController: CameraType {
    
    // MARK: - Properties -
    var onImageCaputured: ((UIImage) -> Void)?
    let image = UIImage(named: "Mount-Everest")!
    
    // MARK: - Exposed function
    func showCamera(on viewController: UIViewController) {
        print("showing Camera live videos")
        onImageCaputured?(image)
    }
}
