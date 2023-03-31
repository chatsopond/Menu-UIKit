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
      // swiftlint:disable:next force_unwrapping
      recipeViewModel = (viewModel as? RecipeInventoryItemDetailCellViewModel)!
    }
  }

  var recipeViewModel: RecipeInventoryItemDetailCellViewModel? {
    didSet {
      updateUI()
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

  func updateUI() {
    setupConstraints()
    styleViews()
  }

  private func setupViews() {
    contentView.addSubview(recipeLabel)
    contentView.addSubview(scrollView)
    scrollView.addSubview(contentScrollView)
  }

  private func styleViews() {
    clipsToBounds = true
    layer.cornerRadius = 12
    layer.masksToBounds = true

    backgroundColor = UIColor(named: "Color/Background Description")?.withAlphaComponent(0.8)

    let font = UIFont(name: "HYWenHei-HEW", size: 17.0)! // swiftlint:disable:this force_unwrapping
    recipeLabel.font = font
    recipeLabel.text = "Recipe"
    recipeLabel.textColor = UIColor(named: "Color/Background Label")

    let squareSize: CGFloat = 80
    let squareViews = recipeViewModel?.recipe.map { item in
      let viewModel = ImageAndBackgroundViewModel(
        // swiftlint:disable:next force_unwrapping
        image: UIImage(named: item.imageName)!,
        backgroundImage: item.backgroundCrispImage
      )
      let view = ImageAndBackgroundView(viewModel: viewModel)
      view.widthAnchor == squareSize
      view.heightAnchor == squareSize
      view.backgroundColor = .gray.withAlphaComponent(0.6)
      view.layer.cornerRadius = 6
      view.layer.masksToBounds = true
      return view
    }

    if let squareViews {
      var previousView: UIView?
      for (i, view) in squareViews.enumerated() {
        contentScrollView.addSubview(view)
        view.topAnchor == contentScrollView.topAnchor
        view.bottomAnchor == contentScrollView.bottomAnchor
        if let previousView = previousView {
          view.leadingAnchor == previousView.trailingAnchor + 8
        } else {
          view.leadingAnchor == contentScrollView.leadingAnchor + 16
        }
        previousView = view
        if i == squareViews.count - 1, let previousView {
          previousView.trailingAnchor == contentScrollView.trailingAnchor
        }
      }
    }
  }

  private func setupConstraints() {
    // Constraints for the UILabel
    recipeLabel.leadingAnchor == contentView.leadingAnchor + 16
    recipeLabel.topAnchor == contentView.topAnchor + 16

    // Constraints for the UIScrollView
    scrollView.leadingAnchor == contentView.leadingAnchor
    scrollView.trailingAnchor == contentView.trailingAnchor
    scrollView.topAnchor == recipeLabel.bottomAnchor + 16

    contentScrollView.edgeAnchors == scrollView.contentLayoutGuide.edgeAnchors
    contentScrollView.heightAnchor == scrollView.frameLayoutGuide.heightAnchor
    contentScrollView.widthAnchor == scrollView.widthAnchor ~ 250
  }
}
