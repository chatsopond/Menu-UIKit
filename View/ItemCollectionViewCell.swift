//
//  ItemCollectionViewCell.swift
//  Menu UIKit
//
//  Created by Chatsopon Deepateep on 22/3/23.
//
// swiftlint:disable force_unwrapping

import UIKit
import Anchorage

class ItemCollectionViewCell: UICollectionViewCell {
  static let reuseIdentifier = "ItemCollectionViewCell"

  var inventoryItem: InventoryItem? {
    didSet {
      styleViews()
    }
  }
  var item: (any Item)? { inventoryItem?.item }

  private let backgroundImage = UIImageView()
  private let itemImage = UIImageView()
  private let itemLabelBackground = UIView()
  private let itemLabel = UILabel()

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
    setupConstraints()
    styleViews()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupViews() {
    contentView.addSubview(backgroundImage)
    contentView.addSubview(itemImage)
    contentView.addSubview(itemLabelBackground)
    itemLabelBackground.addSubview(itemLabel)
  }

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

  private func styleViews() {
    contentView.clipsToBounds = true
    contentView.layer.cornerRadius = 10

    backgroundImage.image = item?.backgroundImage ?? UIImage(named: "Background/Quality_1_background")
    backgroundImage.contentMode = .scaleAspectFill
    backgroundImage.clipsToBounds = true

    itemLabelBackground.backgroundColor = UIColor(named: ("Color/Background Label"))
    itemLabelBackground.clipsToBounds = true

    let font = UIFont(name: "HYWenHei-HEW", size: 17.0)!
    itemLabel.text = "\(inventoryItem?.amount ?? 0)"
    itemLabel.textColor = UIColor(named: "Color/Label")
    itemLabel.font = font
    itemLabel.textAlignment = .center

    itemImage.image = UIImage(named: item?.imageName ?? "")
  }

  func configure(backgroundImage: UIImage, weaponImage: UIImage) {
    self.backgroundImage.image = backgroundImage
    self.itemImage.image = weaponImage
  }
}
