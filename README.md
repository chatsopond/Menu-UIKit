# Menu-UIKit

### Dependencies

- [x] Anchorage

### Objectives

- [x] Adopt MVVM + Coordinator
- [x] Adopt UIKit without Storyboard
- [x] Adopt Anchorage
- UICollectionView
  - [ ] Each item can have a different size.
  - [x] Drag and drop
- Profiling
  - [ ] CPU
  - [ ] Memory (Leak and zombie)

### Architecture

- UIKit without Storyboard
- The design pattern used in this app is called MVVM (Model-View-ViewModel) with the coordinator pattern.

## Features

### Gradient Flow Background

The Gradient Flow Background is made using a programming language called Metal Shading Language. 
Developers can choose four colors for the background by setting the values of the `color1`, `color2`, `color3`, 
and `color4` variables in the `GradientFlowRenderer.swift` file.

```swift
var color1 = SIMD4<Float>(0.370, 0.710, 0.900, 1)
var color2 = SIMD4<Float>(1.000, 0.934, 0.500, 1)
var color3 = SIMD4<Float>(0.878, 0.651, 0.855, 1)
var color4 = SIMD4<Float>(1, 1, 1, 1)
```

This background is energy efficient because it only needs to be redrawn once per second, 
and the rendering process is handled by the GPU.

<img width="330px" src="https://user-images.githubusercontent.com/42887325/227458051-e3d3d7ff-311b-4d7e-b6d9-cac3972cd0ff.gif"/>

### Drag and Drop

I have added the drag and drop functionality to the inventory feature of our application. 
This means that users can now easily move items within their inventory by simply clicking and dragging them to their desired location. 

<img width="330px" src="https://user-images.githubusercontent.com/42887325/227457888-c3138758-7f3d-4130-a1cd-55109db42725.gif">
