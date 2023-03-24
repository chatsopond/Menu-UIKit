//
//  TopAlignedCollectionViewFlowLayout.swift
//  Menu UIKit
//
//  Created by Chatsopon Deepateep on 24/3/23.
//
// swiftlint:disable identifier_name

import UIKit

/// TopAlignedCollectionViewFlowLayout is a custom UICollectionViewFlowLayout subclass that aligns
/// the items in each row of a collection view to the top of their respective rows.
class TopAlignedCollectionViewFlowLayout: UICollectionViewFlowLayout {
  /// `layoutAttributesForElements(in rect: CGRect)` is an overridden method that returns the layout attributes
  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    guard let attributes = super.layoutAttributesForElements(in: rect) else { return nil }

    var maxY: CGFloat = -1.0
    var minY: CGFloat = .infinity
    var firstIndexInRow: Int = 0

    for (index, attribute) in attributes.enumerated() {
      if attribute.frame.origin.y >= maxY || index == 0 {
        // This attribute is in a new row, so update `maxY` and top-align previous row items.
        if index > 0 {
          for j in firstIndexInRow..<index {
            attributes[j].frame.origin.y = minY
          }
        }
        maxY = attribute.frame.maxY
        minY = attribute.frame.minY
        firstIndexInRow = index
      } else {
        // This attribute is in the same row as the previous attribute, align it to the top of the row.
        minY = min(minY, attribute.frame.minY)
        attribute.frame.origin.y = minY
      }
    }
    return attributes
  }
}
