# Menu-UIKit

### Dependencies

- [x] Anchorage

If you are interested in exploring other usage of popular frameworks such as ReactiveSwift, Moya, Realm, and Starscream, you can take a look at the following [this repository](https://github.com/chatsopond/QuickNews-ReactiveSwift)

### Objectives

- [x] Adopt MVVM + Coordinator
- [x] Adopt UIKit without Storyboard
- [x] Adopt Anchorage
- UICollectionView
  - [x] Each item can have a different size.
  - [x] Drag and drop
- UITableView
  - [ ] Each item can have a different size.
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

When a user taps on a cell, the cell smoothly resizes and expands to reveal additional information about the item. The expanded cell then returns to its original size when the user taps on a different cell. It is noticeable that each cell in the collection view is aligned to the top instead of being centered. This means that the cell's origin (i.e., its starting point) is at the top of the cell, rather than at the center. [(See more)](https://github.com/chatsopond/Menu-UIKit/blob/main/Style/TopAlignedAndCenteredFlowLayout.swift)

<img width="545px" src="https://user-images.githubusercontent.com/42887325/228250354-bde53fd2-6382-4235-81be-4b44dfb05cf1.gif"/>

### TopAlignedAndCenteredFlowLayout

TopAlignedAndCenteredFlowLayout is a custom layout for a collection view in this app that aligns the items in each row to the top and centers them horizontally within the row if there is extra space. In other words, it arranges the items in the collection view such that they are neatly aligned and centered within their respective rows for better visual presentation.

<img width="330px" src="https://user-images.githubusercontent.com/42887325/229052940-a07b2887-a2ea-46df-9c84-56d7c6a03d87.gif">

### Detail View

Tap for tailored food details! Each item reveals different contents that depends on food information. Coordinator Design Pattern: The transition between the Inventory View and the Detail View is managed using the Coordinator Design Pattern. This architectural pattern ensures a clean separation of responsibilities, making it easier to maintain and scale the application.

<img width="330px" src="https://user-images.githubusercontent.com/42887325/229055119-5f08f78c-c02d-440a-aab3-a44438b669ca.gif">

## Solved Issue

### Reduced Spacing in Last Row of Collection View

There is a known issue in this project where, if a cell changes size and the last row of the collection view is not full, the spacing between each cell in the last row will be reduced. [(see here)](https://github.com/chatsopond/Menu-UIKit/blob/main/Style/TopAlignedCollectionViewFlowLayout.swift)

**Solved**

Upon further analysis, it became clear that the issue previously encountered was not actually a problem. It is reasonable for the last row with a smaller number of cells to have less spacing, given that cell size is not constant. As the width can change, it is impossible to guarantee a consistent minimum spacing with any additional pixels. To enhance control over cell positioning, it is advised to set cell locations manually. For instance, if the first row is full, its maximum spacing can be calculated and then used as the new minimum spacing for the second row and any following rows. [(See TopAlignedAndCenteredFlowLayout.swift)](https://github.com/chatsopond/Menu-UIKit/blob/main/Style/TopAlignedAndCenteredFlowLayout.swift)
