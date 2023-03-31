//
//  InventoryCoordinator.swift
//  Menu UIKit
//
//  Created by Chatsopon Deepateep on 23/3/23.
//
// swiftlint:disable implicitly_unwrapped_optional

import UIKit

/// Represents the coordinator for the inventory screen
class InventoryCoordinator: Coordinator {
  weak var parentCoordinator: Coordinator?
  var onComplete: (() -> Void)?

  // MARK: - Dependecy Injection
  /// The inventory to be displayed
  private let inventory: Inventory

  // MARK: - Properties
  /// Stores the child coordinators
  var childCoordinators: [Coordinator] = []
  /// A weak reference to the navigation controller used to manage the navigation stack
  weak var navigationController: UINavigationController!

  // MARK: - Body
  /// Initializes the inventory coordinator with a navigation controller and an inventory
  init(navigationController: UINavigationController, inventory: Inventory) {
    self.navigationController = navigationController
    self.inventory = inventory
  }

  /// Starts the inventory coordinator by creating the inventory, view model, and view controller,
  /// then pushing the view controller onto the navigation stack
  func start() {
    // Create a view model with the inventory
    let viewModel = InventoryViewModel(inventory: inventory)
    // Create a view controller with the view model
    let viewController = InventoryViewController(viewModel: viewModel)
    viewController.onItemSelected = { inventoryItem in
      self.showItemDetail(for: inventoryItem)
    }
    // Push the view controller onto the navigation stack
    navigationController?.pushViewController(viewController, animated: true)
  }

  private func showItemDetail(for item: InventoryItem) {
    let itemDetailCoordinator = InventoryItemDetailCoordinator(navigationController: navigationController, item: item)
    itemDetailCoordinator.parentCoordinator = self
    childCoordinators.append(itemDetailCoordinator)
    print("childCoordinators size: \(childCoordinators.count)")
    itemDetailCoordinator.start()
    itemDetailCoordinator.onComplete = { [weak self, weak itemDetailCoordinator] in
      guard let self, let itemDetailCoordinator else { return }
      self.removeChildCoordinator(itemDetailCoordinator)
    }
  }
}
