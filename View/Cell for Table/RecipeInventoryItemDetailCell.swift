//
//  RecipeInventoryItemDetailCell.swift
//  Menu UIKit
//
//  Created by Chatsopon Deepateep on 30/3/23.
//

import UIKit
import Anchorage

class RecipeInventoryItemDetailCell: UITableViewCell, InventoryItemDetailCell {
  static let reuseIdentifier = "RecipeInventoryItemDetailCell"
  var viewModel: (InventoryItemDetailCellViewModel)? {
    didSet {
    }
  }

  let recipeLabel = UILabel()
  let scrollView = UIScrollView()
  var squareViews: [UIView] = []

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      super.init(style: style, reuseIdentifier: reuseIdentifier)

      recipeLabel.text = "Recipe"
      recipeLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
      contentView.addSubview(recipeLabel)

      scrollView.showsHorizontalScrollIndicator = false
      scrollView.isPagingEnabled = true
      contentView.addSubview(scrollView)

      for _ in 0..<3 {
          let squareView = UIView()
          squareView.backgroundColor = .gray // Set your desired background color
          scrollView.addSubview(squareView)
          squareViews.append(squareView)
          squareView.widthAnchor == 80
          squareView.heightAnchor == 80
      }

      scrollView.horizontalAnchors == contentView.horizontalAnchors + 16
      scrollView.bottomAnchor == contentView.bottomAnchor - 16
      scrollView.topAnchor == recipeLabel.bottomAnchor + 8
      scrollView.heightAnchor == squareViews[0].heightAnchor // Set the height equal to the height of the square views

      recipeLabel.topAnchor == contentView.topAnchor + 16
      recipeLabel.leadingAnchor == contentView.leadingAnchor + 16

      // Position the square views horizontally using Anchorage's `.distributeHorizontally()` method
      scrollView.addSubview(squareViews[0])
      squareViews[0].leadingAnchor == scrollView.leadingAnchor
      for i in 1..<squareViews.count {
          scrollView.addSubview(squareViews[i])
          squareViews[i].leadingAnchor == squareViews[i-1].trailingAnchor + 8
      }
      squareViews.last?.trailingAnchor == scrollView.trailingAnchor

      for squareView in squareViews {
          squareView.topAnchor == scrollView.topAnchor
          squareView.bottomAnchor == scrollView.bottomAnchor
      }
  }

  required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
}
