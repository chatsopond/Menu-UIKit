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
    contentView.addSubview(itemImage)
  }

  private func styleViews() {
    clipsToBounds = true
    layer.cornerRadius = 12
    layer.masksToBounds = true
  }

  private func setupConstraints() {
    itemImage.edgeAnchors == contentView.edgeAnchors
  }

  private func updateUI() {
    guard let imageViewModel else { return }
    backgroundView = UIImageView(image: imageViewModel.backgroundImage)
    itemImage.image = UIImage(named: imageViewModel.imageName)
  }
}
