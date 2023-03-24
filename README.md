# Menu-UIKit

### Dependencies

- [x] Anchorage

If you are interested in exploring other usage of popular frameworks such as ReactiveSwift, Moya, Realm, and Starscream, you can take a look at the following [this repository](https://github.com/chatsopond/QuickNews-ReactiveSwift)

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

<img width="330px" src="https://user-images.githubusercontent.com/42887325/227467594-8e08e4f0-4274-4ea3-bcd9-c40ec5b305f8.gif"/>

### Drag and Drop

I have added the drag and drop functionality to the inventory feature of our application. 
This means that users can now easily move items within their inventory by simply clicking and dragging them to their desired location. 

<img width="330px" src="https://user-images.githubusercontent.com/42887325/227466449-21e8c8be-92d0-4751-aafa-c66244edbdbf.gif">

### Dynamic Resizing Collection View Cells

When a user taps on a cell, the cell smoothly resizes and expands to reveal additional information about the item. The expanded cell then returns to its original size when the user taps on a different cell. It is noticeable that each cell in the collection view is aligned to the top instead of being centered. This means that the cell's origin (i.e., its starting point) is at the top of the cell, rather than at the center. [(See more)](https://github.com/chatsopond/Menu-UIKit/blob/main/Style/TopAlignedCollectionViewFlowLayout.swift)

<img width="330px" src="https://user-images.githubusercontent.com/42887325/227534576-6c8b5e81-f1ed-4728-b87c-5617c16d7935.gif"/>

## Known Issues

### Reduced Spacing in Last Row of Collection View

There is a known issue in this project where, if a cell changes size and the last row of the collection view is not full, the spacing between each cell in the last row will be reduced. [(see here)](https://github.com/chatsopond/Menu-UIKit/tree/main/README.md#dynamic-resizing-collection-view-cells)
