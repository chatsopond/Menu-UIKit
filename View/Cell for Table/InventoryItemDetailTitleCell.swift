//
//  InventoryItemDetailTitleCell.swift
//  Menu UIKit
//
//  Created by Chatsopon Deepateep on 30/3/23.
//

import UIKit
import Anchorage

class InventoryItemDetailTitleCell: UITableViewCell {
  static let reuseIdentifier = "InventoryItemDetailTitleCell"

  private let titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .systemFont(ofSize: 18, weight: .bold)
    label.numberOfLines = 0
    return label
  }()

  var viewModel: InventoryItemDetailTitleCellViewModel? {
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
    addSubview(titleLabel)
  }

  private func setupConstraints() {
    titleLabel.edgeAnchors == edgeAnchors
  }

  private func styleViews() {
    titleLabel.textAlignment = .center
    titleLabel.numberOfLines = 1
  }

  private func updateUI() {
    titleLabel.text = viewModel?.title
  }
}
