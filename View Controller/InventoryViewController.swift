//
//  InventoryViewController.swift
//  Menu UIKit
//
//  Created by Chatsopon Deepateep on 22/3/23.
//
// swiftlint:disable: force_cast

import UIKit
import Anchorage

/// This class represents a UIViewController used to display an inventory.
class InventoryViewController: UIViewController {
  /// The view used to display the inventory.
  private let inventoryView: InventoryView

  /// The view model used to populate the inventory.
  private let viewModel: InventoryViewModel

  private var expandedCellIndexPath: IndexPath?

  var onItemSelected: ((InventoryItem) -> Void)?

  /// Initializes a new instance of the InventoryViewController class.
  ///
  /// - Parameter viewModel: The view model to use.
  init(viewModel: InventoryViewModel) {
    self.viewModel = viewModel
    self.inventoryView = InventoryView()
    super.init(nibName: nil, bundle: nil)
  }

  /// Initializes a new instance of the InventoryViewController class.
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  /// Called after the controller's view is loaded into memory.
  override func viewDidLoad() {
    super.viewDidLoad()
    view = inventoryView
    inventoryView.inventoryCollectionView.dataSource = self
    inventoryView.inventoryCollectionView.delegate = self
    inventoryView.inventoryCollectionView.dragInteractionEnabled = true
    inventoryView.inventoryCollectionView.dragDelegate = self
    inventoryView.inventoryCollectionView.dropDelegate = self
  }
}

// MARK: - UICollectionViewDelegate

extension InventoryViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    expandedCellIndexPath = expandedCellIndexPath == indexPath ? nil : indexPath
    collectionView.performBatchUpdates(nil) { animationCompletion in
      guard animationCompletion else { return }
      collectionView.scrollToItem(at: indexPath, at: .bottom, animated: true)
    }

    let inventoryItem = viewModel.item(at: indexPath.row)
    onItemSelected?(inventoryItem)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    // Add extra bottom inset to the last section
    let numberOfSections = collectionView.numberOfSections
    let lastSection = numberOfSections - 1
    if section == lastSection {
      // Add extra bottom inset to the last section
      return UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
    } else {
      return UIEdgeInsets.zero
    }
  }
}

// MARK: - UICollectionViewDataSource

extension InventoryViewController: UICollectionViewDataSource {
  /// Asks your data source object to provide the number of items in the specified section.
  /// - Parameter collectionView: The collection view requesting this information.
  /// - Parameter section: An index number identifying a section in collectionView.
  /// - Returns: The number of rows in section.
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewModel.numberOfItems()
  }

  /// Asks your data source object for the cell that corresponds to the specified item in the collection view.
  /// - Parameter collectionView: The collection view requesting this information.
  /// - Parameter indexPath: The index path that specifies the location of the item.
  /// - Returns: A configured cell object. You must not return nil from this method.
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: ItemCollectionViewCell.reuseIdentifier,
      for: indexPath) as! ItemCollectionViewCell
    let inventoryItem = viewModel.item(at: indexPath.row)
    let cellViewModel = ItemCollectionViewModel(inventoryItem: inventoryItem)
    cell.viewModel = cellViewModel
    return cell
  }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension InventoryViewController: UICollectionViewDelegateFlowLayout {
  /// Asks the delegate for the size of the specified item’s cell.
  /// - Parameter collectionView: The collection view object displaying the flow layout.
  /// - Parameter collectionViewLayout: The layout object requesting the information.
  /// - Parameter indexPath: The index path of the item.
  /// - Returns: The width and height of the specified item. Both values must be greater than 0.
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 112, height: expandedCellIndexPath == indexPath ? 216 : 136)
  }
}


// MARK: - Drag & Drop

extension InventoryViewController: UICollectionViewDragDelegate, UICollectionViewDropDelegate {
  /// Prepares one or more drag items with the data for the specified index path.
  func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
    // Get the item at the specified index path
    let item = viewModel.item(at: indexPath.row)
    // Create an item provider with the item's identifier
    let itemProvider = NSItemProvider(object: item.id as NSString)
    // Create a drag item with the item provider
    let dragItem = UIDragItem(itemProvider: itemProvider)
    // Store the local object in the drag item
    dragItem.localObject = item
    // Return the drag item in an array
    return [dragItem]
  }

  /// Performs the drop operation at the destination index path.
  func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
    // Ensure we have a destination index path
    guard let destinationIndexPath = coordinator.destinationIndexPath else { return }
    // Get the first item from the coordinator's items and ensure it has a source index path
    guard let item = coordinator.items.first,
      let sourceIndexPath = item.sourceIndexPath else { return }
    // Perform batch updates to move the item within the view model and the collection view
    collectionView.performBatchUpdates {
      viewModel.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
      collectionView.moveItem(at: sourceIndexPath, to: destinationIndexPath)
    }
    // Complete the drop operation
    coordinator.drop(item.dragItem, toItemAt: destinationIndexPath)
  }

  /// Determines if the collection view can handle the drop session.
  func collectionView(_ collectionView: UICollectionView, canHandle session: UIDropSession) -> Bool {
    // Return true if the session can load objects of class NSString, false otherwise
    return session.canLoadObjects(ofClass: NSString.self)
  }

  /// Updates the drop proposal based on the destination index path.
  func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
    // If the collection view has an active drag, return a drop proposal with .move operation and .insertAtDestinationIndexPath intent
    if collectionView.hasActiveDrag {
      return UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
    }
    // If the collection view does not have an active drag, return a drop proposal with .forbidden operation
    return UICollectionViewDropProposal(operation: .forbidden)
  }
}
