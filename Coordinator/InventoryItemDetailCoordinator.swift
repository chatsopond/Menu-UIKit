//
//  InventoryItemDetailCoordinator.swift
//  Menu UIKit
//
//  Created by Chatsopon Deepateep on 30/3/23.
//
// swiftlint:disable implicitly_unwrapped_optional

import UIKit

class InventoryItemDetailCoordinator: Coordinator {
  weak var parentCoordinator: Coordinator?
  var onComplete: (() -> Void)?

  var childCoordinators: [Coordinator] = []
  weak var navigationController: UINavigationController!
  private let item: InventoryItem

  init(navigationController: UINavigationController, item: InventoryItem) {
    self.navigationController = navigationController
    self.item = item
  }

  func start() {
    let viewModel = ItemDetailViewModel(item: item)
    let viewController = InventoryItemDetailViewController(viewModel: viewModel)

    // Create a new navigation controller for the modally presented view controller
    let itemDetailNavigationController = UINavigationController(rootViewController: viewController)
    navigationController?.present(itemDetailNavigationController, animated: true) { [weak self] in
      guard let self else { return }
      onComplete?()
    }
  }
}
