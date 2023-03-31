//
//  ImageInventoryItemDetailCell.swift
//  Menu UIKit
//
//  Created by Chatsopon Deepateep on 30/3/23.
//

import UIKit
import Anchorage

class ImageInventoryItemDetailCell: UITableViewCell, InventoryItemDetailCell {
  static let reuseIdentifier = "ImageInventoryItemDetailCell"
  var viewModel: (InventoryItemDetailCellViewModel)? {
    didSet {
      // swiftlint:disable:next force_unwrapping
      imageViewModel = (viewModel as? ImageInventoryItemDetailCellViewModel)!
    }
  }

  let detailView = UIView()
  let itemBackgroundImage = UIImageView()
  let itemImage = UIImageView()

  var imageViewModel: ImageInventoryItemDetailCellViewModel? {
    didSet {
      updateUI()
    }
  }

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupUI() {
    setupViews()
    setupConstraints()
    styleViews()
  }

  private func setupViews() {
    selectionStyle = .none
    contentView.addSubview(detailView)
    detailView.addSubview(itemBackgroundImage)
    detailView.addSubview(itemImage)
    detailView.sendSubviewToBack(itemBackgroundImage)
  }

  private func styleViews() {
    backgroundColor = .clear

    clipsToBounds = true
    layer.cornerRadius = 12
    layer.masksToBounds = true

    detailView.clipsToBounds = true
    detailView.layer.cornerRadius = 12
    detailView.layer.masksToBounds = true
  }

  private func setupConstraints() {
    detailView.leadingAnchor == contentView.leadingAnchor
    detailView.trailingAnchor == contentView.trailingAnchor
    detailView.topAnchor == contentView.topAnchor
    detailView.bottomAnchor == contentView.bottomAnchor - (viewModel?.bottomPadding ?? 0)
    itemBackgroundImage.edgeAnchors == detailView.edgeAnchors
    itemImage.edgeAnchors == detailView.edgeAnchors
  }

  private func updateUI() {
    guard let imageViewModel else { return }
    itemImage.image = UIImage(named: imageViewModel.imageName)
    itemBackgroundImage.image = imageViewModel.backgroundImage
    setupConstraints()
  }
}
