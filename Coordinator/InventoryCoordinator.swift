//
//  InventoryCoordinator.swift
//  Menu UIKit
//
//  Created by Chatsopon Deepateep on 23/3/23.
//

import UIKit

class InventoryCoordinator: Coordinator {
  var childCoordinators: [Coordinator] = []
  weak var navigationController: UINavigationController?

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  func start() {
    let inventory = Inventory(
      inventoryItems: [
        .init(item: FoodItemCatalog.apple, amount: 104),
        .init(item: FoodItemCatalog.sunsettia, amount: 6),
        .init(item: FoodItemCatalog.dangoMilk, amount: 12)
      ])
    let viewModel = InventoryViewModel(inventory: inventory)
    let viewController = InventoryViewController(viewModel: viewModel)
    navigationController?.pushViewController(viewController, animated: true)
  }
}
