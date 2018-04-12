# CoreML

## AI

Artifishal Intelligence 

- intelligence demonstrated by machines.
- Could just be a bunch of if statements.
- Early stages of AI were very much like this.
- In the 21st century, AI has been much more about Machine Learning.

## ML

- Generates the logic for you.

normal programming:
(data, logic) -> outcomes

machine learning:
(data, outcomes) -> logic

## Deep Learning & Neural Networks

- best way of training computer vision and natural language detection.
- Neural networks dont' imply special brain like hardware. 
- Deapth refers to the number of layers in the neural network.

- Deep learning uses `matrix` math to determine the best weights for each connection. To translate input into output.

- Graphics processors have been designed to handle linear algebra very well so that we can render advanced graphics.

- Deep learning uses `tensors`. A tensor is a container for data. 
- google has an open source machine learning framework, called tensorflow. 
- Google has started developing TPUs.

- Apple released metal for iOS 8. metal is a very close to the hardware (gpu) language. 

## Coding, Python & Frameworks

- Why is all machine learning in python?
  - python is a much easier language to learn and use. 
  - a lot of the mathy python stuff, under the hood, it's mostly C or Fortran
  - numpy, matrix math, all math operations can be c or fortan under the hood.

- Tensor flow, Keras

- [Turi Create](https://github.com/apple/turicreate/blob/master/README.md)

---

## iOS

- we don't train on iOS, we use on iOS.
- you could have users submit their data to a server, then integrate that data back into the model, then download a new model to the device.
- Watson (IBM) does this.

### Vision

- Framework that you can use that uses coreml, that does some simple computer vision stuff.
- You can use vision, with core image, with coreml. 

---

## Links

### ML

- [Videos on the technical details](https://www.youtube.com/playlist?list=PLZHQObOWTQDNU6R1_67000Dx_ZCJB-3pi)
- [Python Crash Course](https://machinelearningmastery.com/crash-course-python-machine-learning-developers/)

### Core ML

- [Ray Wenderlich](https://www.raywenderlich.com/164213/coreml-and-vision-machine-learning-in-ios-11-tutorial)