//
//  InventoryItemDetailCell.swift
//  Menu UIKit
//
//  Created by Chatsopon Deepateep on 30/3/23.
//

import Foundation

protocol InventoryItemDetailCell: AnyObject {
  static var reuseIdentifier: String { get }
  var viewModel: (any InventoryItemDetailCellViewModel)? { get set }
}
