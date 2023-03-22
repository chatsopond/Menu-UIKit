//
//  ItemCollectionViewCell.swift
//  Menu UIKit
//
//  Created by Chatsopon Deepateep on 22/3/23.
//

import UIKit
import Anchorage

class ItemCollectionViewCell: UICollectionViewCell {
  static let reuseIdentifier = "ItemCollectionViewCell"

  private let backgroundImage = UIImageView()
  private let itemImage = UIImageView()
  private let itemLabelBackground = UIView()
  private let levelLabel = UILabel()

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
    itemLabelBackground.addSubview(levelLabel)
  }

  private func setupConstraints() {

    backgroundImage.horizontalAnchors == contentView.horizontalAnchors
    backgroundImage.verticalAnchors == contentView.verticalAnchors

//    backgroundImage.edgeAnchors == contentView.edgeAnchors
//    itemImage.centerAnchors == contentView.centerAnchors
//    itemImage.widthAnchor <= contentView.widthAnchor * 0.8
//    itemImage.heightAnchor <= contentView.heightAnchor * 0.8
//
//    itemLabelBackground.bottomAnchor == contentView.bottomAnchor
//    itemLabelBackground.leadingAnchor == contentView.leadingAnchor
//    itemLabelBackground.trailingAnchor == contentView.trailingAnchor
//    itemLabelBackground.heightAnchor == 32
//
//    levelLabel.centerYAnchor == itemLabelBackground.centerYAnchor
//    levelLabel.leadingAnchor == itemLabelBackground.leadingAnchor + 8
  }

  private func styleViews() {
    backgroundImage.image = UIImage(named: "Background/Quality_5_background")
    backgroundImage.contentMode = .scaleAspectFill
    backgroundImage.clipsToBounds = true

//    itemImage.contentMode = .scaleAspectFit
//    itemLabelBackground.backgroundColor = UIColor.black.withAlphaComponent(0.5)
//
//    levelLabel.text = "Lv. 50"
//    levelLabel.textColor = .white
//    levelLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
  }

  func configure(backgroundImage: UIImage, weaponImage: UIImage) {
    self.backgroundImage.image = backgroundImage
    self.itemImage.image = weaponImage
  }
}

