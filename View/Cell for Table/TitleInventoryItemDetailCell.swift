//
//  TitleInventoryItemDetailCell.swift
//  Menu UIKit
//
//  Created by Chatsopon Deepateep on 30/3/23.
//

import UIKit
import Anchorage

class TitleInventoryItemDetailCell: UITableViewCell, InventoryItemDetailCell {
  static let reuseIdentifier = "TitleInventoryItemDetailCell"
  var viewModel: (InventoryItemDetailCellViewModel)? {
    didSet {
      // swiftlint:disable:next force_unwrapping
      titleViewModel = (viewModel as? TitleInventoryItemDetailCellViewModel)!
    }
  }

  private let titleView = UIView()

  private let titleLabel: UILabel = {
    let label = UILabel()
    let font = UIFont(name: "HYWenHei-HEW", size: 17.0)! // swiftlint:disable:this force_unwrapping
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = font
    label.numberOfLines = 0
    return label
  }()

  var titleViewModel: TitleInventoryItemDetailCellViewModel? {
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
    clipsToBounds = true
    layer.cornerRadius = 12
    layer.masksToBounds = true

    titleView.clipsToBounds = true
    titleView.layer.cornerRadius = 12
    titleView.layer.masksToBounds = true

    contentView.addSubview(titleView)
    titleView.addSubview(titleLabel)
  }

  private func setupConstraints() {
    contentView.edgeAnchors == edgeAnchors
    titleView.leadingAnchor == contentView.leadingAnchor
    titleView.trailingAnchor == contentView.trailingAnchor
    titleView.topAnchor == contentView.topAnchor
    titleView.bottomAnchor == contentView.bottomAnchor - (viewModel?.bottomPadding ?? 0)
    titleLabel.edgeAnchors == titleView.edgeAnchors
  }

  private func styleViews() {
    backgroundColor = .clear
    contentView.backgroundColor = .clear
    titleView.backgroundColor = UIColor(named: "Color/Background Title")
    titleLabel.textAlignment = .center
    titleLabel.numberOfLines = 1
  }

  private func updateUI() {
    titleLabel.text = titleViewModel?.title
    setupConstraints()
  }
}
