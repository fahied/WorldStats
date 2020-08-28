/*
 *	CameraController.swift
 *	WorldStats
 *
 *	Created by Muhammad Fahied on 8/28/20.
 *	Copyright 2020 Fahied. All rights reserved.
 */

import UIKit

// MARK: - Definitions -
protocol CameraType {
    var onImageCaputured: ((UIImage) -> Void)? { get set}
    func showCamera(on viewController: UIViewController)
}
// MARK: - Type -

class CameraController: NSObject, CameraType {
    
    // MARK: - Properties
    let imagePicker = UIImagePickerController()
    
    var onImageCaputured: ((UIImage) -> Void)?
    
    // MARK: - Constructors
    
    // MARK: - Protected Methods
    
    // MARK: - Exposed Methods
    func showCamera(on viewController: UIViewController) {
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        viewController.present(imagePicker, animated: true)
    }
    
    // MARK: - Overridden Methods
    
}

extension CameraController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)

        guard let image = info[.editedImage] as? UIImage else {
            print("No image found")
            return
        }

        // print out the image size as a test
        onImageCaputured?(image)
        print(image.size)
    }
}

