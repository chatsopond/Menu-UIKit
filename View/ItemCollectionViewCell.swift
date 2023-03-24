//
//  ItemCollectionViewCell.swift
//  Menu UIKit
//
//  Created by Chatsopon Deepateep on 22/3/23.
//
// swiftlint:disable force_unwrapping

import UIKit
import Anchorage

/// This class represents a custom UICollectionViewCell used to display an InventoryItem.
class ItemCollectionViewCell: UICollectionViewCell {
  /// The reusable identifier for the cell.
  static let reuseIdentifier = "ItemCollectionViewCell"

  var viewModel: ItemCollectionViewModel? {
    didSet {
      styleViews()
    }
  }

  /// The background image of the cell.
  private let backgroundImage = UIImageView()

  /// The image of the item.
  private let itemImage = UIImageView()

  /// The background view for the item label.
  private let itemLabelBackground = UIView()

  /// The label displaying the amount of the item.
  private let itemLabel = UILabel()

  /// Initializes a new instance of the ItemCollectionViewCell class.
  ///
  /// - Parameter frame: The frame for the cell.
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
    setupConstraints()
    styleViews()
  }

  /// Initializes a new instance of the ItemCollectionViewCell class.
  ///
  /// - Parameter coder: The NSCoder used to decode the cell.
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  /// Sets up the subviews of the cell.
  private func setupViews() {
    contentView.addSubview(backgroundImage)
    contentView.addSubview(itemImage)
    contentView.addSubview(itemLabelBackground)
    itemLabelBackground.addSubview(itemLabel)

    let clearView = UIView()
    clearView.backgroundColor = .clear
    selectedBackgroundView = clearView
  }

  /// Sets up the constraints for the subviews of the cell.
  private func setupConstraints() {
    backgroundImage.horizontalAnchors == contentView.horizontalAnchors
    backgroundImage.verticalAnchors == contentView.verticalAnchors

    itemLabelBackground.horizontalAnchors == contentView.horizontalAnchors
    itemLabelBackground.bottomAnchor == contentView.bottomAnchor
    itemLabelBackground.heightAnchor == 24

    itemLabel.horizontalAnchors == itemLabelBackground.horizontalAnchors
    itemLabel.topAnchor == itemLabelBackground.topAnchor + 5
    itemLabel.bottomAnchor == itemLabelBackground.bottomAnchor - 5

    itemImage.horizontalAnchors == contentView.horizontalAnchors
    itemImage.topAnchor == contentView.topAnchor
    itemImage.bottomAnchor == itemLabelBackground.topAnchor
  }

  /// Styles the subviews of the cell.
  private func styleViews() {
    clipsToBounds = true
    layer.cornerRadius = 10
    layer.masksToBounds = true

    backgroundImage.image = viewModel?.item.backgroundImage ?? UIImage(named: "Background/Quality_1_background")
    backgroundImage.contentMode = .scaleAspectFill
    backgroundImage.clipsToBounds = true

    itemLabelBackground.backgroundColor = UIColor(named: ("Color/Background Label"))
    itemLabelBackground.clipsToBounds = true

    let font = UIFont(name: "HYWenHei-HEW", size: 17.0)!
    itemLabel.text = "\(viewModel?.inventoryItem.amount ?? 0)"
    itemLabel.textColor = UIColor(named: "Color/Label")
    itemLabel.font = font
    itemLabel.textAlignment = .center

    itemImage.image = UIImage(named: viewModel?.item.imageName ?? "")
  }
}
