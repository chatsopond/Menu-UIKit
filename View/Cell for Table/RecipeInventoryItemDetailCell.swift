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
  let contentScrollView = UIView()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    setupUI()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setupUI() {
    setupViews()
    setupConstraints()
    styleViews()
  }

  private func setupViews() {
    contentView.addSubview(recipeLabel)
    contentView.addSubview(scrollView)
    scrollView.addSubview(contentScrollView)
  }

  private func styleViews() {
    recipeLabel.text = "Recipe"

    let squareSize: CGFloat = 80
    let squareViews = (0..<30).map { _ -> UIView in
      let view = UIView()
      view.widthAnchor == squareSize
      view.heightAnchor == squareSize
      view.backgroundColor = .gray
      return view
    }

    var previousView: UIView?
    for view in squareViews {
      contentScrollView.addSubview(view)
      view.topAnchor == contentScrollView.topAnchor
      view.bottomAnchor == contentScrollView.bottomAnchor
      if let previousView = previousView {
        view.leadingAnchor == previousView.trailingAnchor + 8
      } else {
        view.leadingAnchor == contentScrollView.leadingAnchor
      }
      previousView = view
    }
//    previousView?.trailingAnchor == contentScrollView.trailingAnchor
  }


  private func setupConstraints() {
    // Constraints for the UILabel
    recipeLabel.leadingAnchor == contentView.leadingAnchor + 8
    recipeLabel.topAnchor == contentView.topAnchor + 8

    // Constraints for the UIScrollView
    scrollView.leadingAnchor == contentView.leadingAnchor
    scrollView.trailingAnchor == contentView.trailingAnchor
    scrollView.topAnchor == recipeLabel.bottomAnchor + 8
    scrollView.bottomAnchor == contentView.bottomAnchor - 8

    contentScrollView.edgeAnchors == scrollView.contentLayoutGuide.edgeAnchors
    contentScrollView.heightAnchor == scrollView.frameLayoutGuide.heightAnchor
    contentScrollView.widthAnchor == scrollView.widthAnchor ~ 250
  }
}
