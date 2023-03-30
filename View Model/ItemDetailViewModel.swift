//
//  ItemDetailViewModel.swift
//  Menu UIKit
//
//  Created by Chatsopon Deepateep on 30/3/23.
//

import UIKit

class ItemDetailViewModel {
  let item: InventoryItem
  private(set) var cellViewModels: [any InventoryItemDetailCellViewModel] = []

  init(item: InventoryItem) {
    self.item = item

    let titleViewModel = TitleInventoryItemDetailCellViewModel(inventoryItem: item)
    cellViewModels.append(titleViewModel)
    let imageViewModel = ImageInventoryItemDetailCellViewModel(inventoryItem: item)
    cellViewModels.append(imageViewModel)
    if item.item.recipe != nil {
      let recipeViewModel = RecipeInventoryItemDetailCellViewModel(inventoryItem: item)
      cellViewModels.append(recipeViewModel)
    }
  }

  func cellViewModel(at indexPath: IndexPath) -> any InventoryItemDetailCellViewModel {
    return cellViewModels[indexPath.row]
  }
}
