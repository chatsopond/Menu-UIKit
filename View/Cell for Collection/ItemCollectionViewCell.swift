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

  private let stackView = UIStackView()

  private let itemCoverView = UIView()
  /// The background image of the cell.
  private let itemBackgroundImage = UIImageView()
  /// The image of the item.
  private let itemImage = UIImageView()
  /// The background view for the item label.
  private let itemLabelBackground = UIView()
  /// The label displaying the amount of the item.
  private let itemLabel = UILabel()

  private let itemDetailView = UIView()
  private let itemDetailScrollView = UIScrollView()
  private let itemDetailStackView = UIStackView()
  private let itemDetailLabel = UILabel()

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
    contentView.addSubview(stackView)
    stackView.addArrangedSubview(itemCoverView)
    stackView.addArrangedSubview(itemDetailView)

    // Item Cover View
    itemCoverView.accessibilityLabel = "112x136"
    itemBackgroundImage.accessibilityLabel = "Item Background"
    itemImage.accessibilityLabel = "Item Image"
    itemLabelBackground.accessibilityLabel = "Item Label Background"
    itemCoverView.addSubview(itemBackgroundImage)
    itemCoverView.addSubview(itemImage)
    itemCoverView.addSubview(itemLabelBackground)

    // Item Label Background View
    itemLabel.accessibilityLabel = "Item Label"
    itemLabelBackground.addSubview(itemLabel)

    // Item Detail View
    itemDetailView.accessibilityLabel = "112x80"
    itemDetailView.addSubview(itemDetailScrollView)
    itemDetailScrollView.addSubview(itemDetailStackView)
    itemDetailStackView.addArrangedSubview(itemDetailLabel)
  }

  /// Sets up the constraints for the subviews of the cell.
  private func setupConstraints() {
    stackView.edgeAnchors == contentView.edgeAnchors
    stackView.axis = .vertical
    stackView.alignment = .center
    stackView.distribution = .fill
    stackView.spacing = 6

    // This ensures that the stack view won't resize the views vertically,
    // and that the views won't be compressed or stretched by the stack view.
    itemCoverView.setContentHuggingPriority(.required, for: .vertical)
    itemCoverView.setContentCompressionResistancePriority(.required, for: .vertical)
    itemDetailView.setContentHuggingPriority(.required, for: .vertical)
    itemDetailView.setContentCompressionResistancePriority(.required, for: .vertical)

    itemCoverView.widthAnchor == stackView.widthAnchor
    itemCoverView.heightAnchor == 136

    itemBackgroundImage.edgeAnchors == itemCoverView.edgeAnchors

    itemLabelBackground.horizontalAnchors == itemCoverView.horizontalAnchors
    itemLabelBackground.bottomAnchor == itemCoverView.bottomAnchor
    itemLabelBackground.heightAnchor == 24

    itemLabel.horizontalAnchors == itemLabelBackground.horizontalAnchors
    itemLabel.topAnchor == itemLabelBackground.topAnchor + 5
    itemLabel.bottomAnchor == itemLabelBackground.bottomAnchor - 5

    itemImage.horizontalAnchors == itemCoverView.horizontalAnchors
    itemImage.topAnchor == itemCoverView.topAnchor
    itemImage.bottomAnchor == itemLabelBackground.topAnchor

    itemDetailView.topAnchor == itemCoverView.bottomAnchor + 5
    itemDetailView.widthAnchor == contentView.widthAnchor

    itemDetailScrollView.edgeAnchors == itemDetailView.edgeAnchors

    itemDetailStackView.axis = .vertical
    itemDetailStackView.alignment = .center
    itemDetailStackView.distribution = .fillEqually
    itemDetailStackView.edgeAnchors == itemDetailScrollView.edgeAnchors
    itemDetailStackView.widthAnchor == itemDetailScrollView.widthAnchor

    let insets = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
    itemDetailLabel.edgeAnchors == itemDetailStackView.edgeAnchors + insets
  }

  /// Styles the subviews of the cell.
  private func styleViews() {
    let clearView = UIView()
    clearView.backgroundColor = .clear
    selectedBackgroundView = clearView
    itemDetailLabel.numberOfLines = 0

    clipsToBounds = true
    layer.cornerRadius = 10
    layer.masksToBounds = true

    itemCoverView.clipsToBounds = true
    itemCoverView.layer.cornerRadius = 10
    itemCoverView.layer.masksToBounds = true

    itemDetailView.clipsToBounds = true
    itemDetailView.layer.cornerRadius = 10
    itemDetailView.layer.masksToBounds = true
    itemDetailView.backgroundColor = UIColor(named: ("Color/Background Label"))?.withAlphaComponent(0.5)

    itemBackgroundImage.image = viewModel?.item.backgroundImage ?? UIImage(named: "Background/Quality_1_background")
    itemBackgroundImage.contentMode = .scaleAspectFill
    itemBackgroundImage.clipsToBounds = true

    itemLabelBackground.backgroundColor = UIColor(named: ("Color/Background Label"))
    itemLabelBackground.clipsToBounds = true

    let font = UIFont(name: "HYWenHei-HEW", size: 17.0)!
    itemLabel.text = "\(viewModel?.inventoryItem.amount ?? 0)"
    itemLabel.textColor = UIColor(named: "Color/Label")
    itemLabel.font = font
    itemLabel.textAlignment = .center

    itemImage.image = UIImage(named: viewModel?.item.imageName ?? "")
    itemImage.contentMode = .scaleAspectFill

    let detailFont = UIFont(name: "HYWenHei-HEW", size: 12.0)!
    itemDetailLabel.text = viewModel?.inventoryItem.item.description ?? ""
    itemDetailLabel.textColor = UIColor(named: "Color/Label")
    itemDetailLabel.font = detailFont
    itemDetailLabel.textAlignment = .center
    itemDetailLabel.numberOfLines = 0
  }
}
