//
//  TopAlignedAndCenteredFlowLayout.swift
//  Menu UIKit
//
//  Created by Chatsopon Deepateep on 24/3/23.
//
// swiftlint:disable identifier_name line_length cyclomatic_complexity

import UIKit

/// `TopAlignedAndCenteredFlowLayout` is a custom `UICollectionViewFlowLayout` subclass that aligns
/// the items in each row of a collection view to the top of their respective rows and centers them
/// horizontally within the row if there is extra space.
class TopAlignedAndCenteredFlowLayout: UICollectionViewFlowLayout {
  /// The maximum spacing between items in the same row.
  let maximumSpacing: CGFloat = 32

  override func prepare() {
    super.prepare()
    minimumInteritemSpacing = maximumSpacing
    minimumLineSpacing = maximumSpacing
  }

  /// This method returns the layout attributes for all items in the specified rectangle.
  /// It adjusts the origin.y of the items to align them to the top of their respective rows
  /// and centers the items horizontally within the row if there is extra space.
  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    guard let attributes = super.layoutAttributesForElements(in: rect)?.map({ $0.copy() }) as? [UICollectionViewLayoutAttributes] else { return nil }

    // maxY is used to track the maximum y-coordinate of the previous row.
    var maxY: CGFloat = -1.0
    // minY is used to track the minimum y-coordinate of the items in the current row.
    var minY: CGFloat = .infinity
    // firstIndexInRow is used to track the index of the first item in the current row.
    var firstIndexInRow = 0
    // spacing is used to track the horizontal spacing between the items in the current row.
    var spacing: CGFloat = 0
    // lastAttributeInFirstRow is used to track the last item in the first row for centering items.
    var lastAttributeInFirstRow: UICollectionViewLayoutAttributes?

    for (index, attribute) in attributes.enumerated() {
      if attribute.frame.origin.y >= maxY || index == 0 {
        // This attribute is in a new row, so update maxY and top-align previous row items.
        if index > 0 {
          if spacing == 0 {
            spacing = attributes[1].frame.maxX - attributes[0].frame.maxX
          }
          // Top-align previous row items
          for j in firstIndexInRow..<index {
            attributes[j].frame.origin.y = minY
          }
          if lastAttributeInFirstRow == nil {
            lastAttributeInFirstRow = attributes[index - 1]
          }
        }
        // Update maxY and minY for the new row.
        maxY = attribute.frame.maxY
        minY = attribute.frame.minY
        firstIndexInRow = index
      } else {
        // This attribute is in the same row as the previous attribute, align it to the top of the row.
        minY = min(minY, attribute.frame.minY)
        attribute.frame.origin.y = minY

        let currentSpacing = attribute.frame.maxX - attributes[index - 1].frame.maxX
        if spacing == 0 || currentSpacing > maximumSpacing {
          spacing = maximumSpacing
          attribute.frame.origin.x = attributes[index - 1].frame.maxX + spacing
        }
      }
    }
    // Top-align the last row items.
    for j in firstIndexInRow..<attributes.count {
      let i = j - firstIndexInRow
      if spacing != 0, i > 0 {
        attributes[j].frame.origin.x = attributes[j - 1].frame.maxX + spacing
      }
      attributes[j].frame.origin.y = minY
    }

    // Revise the free spacing to center items horizontally within the row.
    if let lastAttributeInFirstRow = lastAttributeInFirstRow {
      let rightEmptyPad = (collectionViewContentSize.width - sectionInset.right) - lastAttributeInFirstRow.frame.maxX
      if rightEmptyPad > 0 {
        for attribute in attributes {
          attribute.frame.origin.x += rightEmptyPad / 2
        }
      }
    }

    return attributes
  }
}
