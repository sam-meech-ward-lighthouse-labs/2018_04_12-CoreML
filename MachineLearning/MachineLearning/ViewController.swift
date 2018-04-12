//
//  ViewController.swift
//  MachineLearning
//
//  Created by Sam Meech-Ward on 2018-04-12.
//  Copyright © 2018 meech-ward. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var label: UILabel!
  @IBOutlet weak var imageView: UIImageView!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func selectImage(_ sender: Any) {
    openImagePicker()
  }
  
  func imageSelected(image: UIImage) {
    imageView.image = image
    
    let ciImage = CIImage(image: image)!
    let imageProcessor = ImageProcessor(image: ciImage)
    imageProcessor.process { message in
      DispatchQueue.main.async {
        self.label.text = message
      }
    }
  }
  
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  func openImagePicker() {
    let imagePicker = UIImagePickerController()
    
    if UIImagePickerController.isSourceTypeAvailable(.camera) {
      imagePicker.sourceType = .camera
    } else {
      imagePicker.sourceType = .photoLibrary
    }
    
    imagePicker.delegate = self
    
    present(imagePicker, animated: true, completion: nil)
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    
    guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else {
      fatalError("Image wrong")
    }
    
    imageSelected(image: image)
    
    dismiss(animated: true, completion: nil)
  }
  
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    dismiss(animated: true, completion: nil)
  }
  
}

