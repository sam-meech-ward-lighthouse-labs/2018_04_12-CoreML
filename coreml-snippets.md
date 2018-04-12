
### Image Picker

`NSPhotoLibraryUsageDescription`
`NSCameraUsageDescription`

Select Image

```swift
func pickImage() {
  let imagePicker = UIImagePickerController()
  
  if (UIImagePickerController.isSourceTypeAvailable(.camera)) {
    imagePicker.sourceType = .camera
  } else {
    imagePicker.sourceType = .photoLibrary
  }
  
  imagePicker.delegate = self
  
  present(imagePicker, animated: true, completion: nil)
}
```

```swift
func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
  guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else {
    fatalError("couldn't convert UIImage to CIImage")
  }
  
  dismiss(animated: true) {
    self.imageSelected(image: image)
  }
}
```

### ML

```
func detectScene(completion: @escaping (String)->(Void)) {
  
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
    
  // Run the Core ML GoogLeNetPlaces classifier on global dispatch queue
  let handler = VNImageRequestHandler(ciImage: self.image)
  DispatchQueue.global(qos: .userInteractive).async {
    do {
      try handler.perform([request])
    } catch {
      completion(error.localizedDescription)
    }
  }
}
```