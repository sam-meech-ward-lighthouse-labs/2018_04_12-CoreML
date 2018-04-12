//
//  ImageProcessor.swift
//  MachineLearning
//
//  Created by Sam Meech-Ward on 2018-04-12.
//  Copyright © 2018 meech-ward. All rights reserved.
//

import Foundation
import CoreImage
import CoreML
import Vision

struct ImageProcessor {
  
  let image: CIImage
  
  func process(completion: @escaping (String)->(Void)) {
    
    guard let model = try? VNCoreMLModel(for: MobileNet().model) else {
      completion("can't load Places ML model")
      return
    }
    
    // Create a Vision request with completion handler
    let request = VNCoreMLRequest(model: model) { request, error in
      
      guard let results = request.results as? [VNClassificationObservation]
        else {
          completion("unexpected result type from VNCoreMLRequest")
          return
      }
      
      // Completion
      let topResult = results[0]
      let secondResult = results[1]
      let text = """
      \(Int(topResult.confidence * 100))% \(topResult.identifier)
      \(Int(secondResult.confidence * 100))% \(secondResult.identifier)
      """
      completion(text)
    }
    
    // Run the Core ML classifier on global dispatch queue
    let handler = VNImageRequestHandler(ciImage: self.image)
    DispatchQueue.global(qos: .userInteractive).async {
      do {
        try handler.perform([request])
      } catch {
        completion(error.localizedDescription)
      }
    }
  }
}
