//
//  TopLeftAlignedCollectionViewFlowLayout.swift
//  Menu UIKit
//
//  Created by Chatsopon Deepateep on 24/3/23.
//
// swiftlint:disable line_length

import UIKit

/// `TopLeftAlignedCollectionViewFlowLayout` is a custom layout that aligns collection view cells at the top-left edge
/// of the collection view, overriding the default behavior that centers cells within the collection view.
class TopLeftAlignedCollectionViewFlowLayout: UICollectionViewFlowLayout {
  /// This method calculates the layout attributes for all the cells and supplementary views within the specified
  /// rectangle, and then adjusts the frame of each cell to align them to the top-left edge.
  ///
  /// - Parameter rect: The rectangle (specified in the collection view’s coordinate system) containing the target views.
  /// - Returns: An array of layout attribute objects containing the layout information for the cells and views.
  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    // Get the original layout attributes, create a mutable copy of them
    let attributes = super.layoutAttributesForElements(in: rect)?.map { $0.copy() } as? [UICollectionViewLayoutAttributes]
    // Iterate through the layout attributes and adjust the y-origin of each cell's frame
    attributes?.forEach { layoutAttribute in
      // Only modify cells, not supplementary views or decoration views
      if layoutAttribute.representedElementCategory == .cell {
        // Calculate the new y-origin based on the row of the cell (ignoring the default centering behavior)
        layoutAttribute.frame.origin.y = CGFloat(Int(layoutAttribute.frame.origin.y / (itemSize.height + minimumLineSpacing)) * Int(itemSize.height + minimumLineSpacing))
      }
    }
    return attributes
  }
}
