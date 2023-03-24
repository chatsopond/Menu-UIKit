//
//  Item.swift
//  Menu UIKit
//
//  Created by Chatsopon Deepateep on 23/3/23.
//
// swiftlint:disable force_unwrapping

import UIKit

/// A protocol for items in an inventory
protocol Item: Identifiable {
  /// The unique identifier of the item
  var id: String { get }
  /// The name of the image file for the item
  var imageName: String { get }
  /// The title of the item
  var title: String { get }
  /// The description of the item
  var description: String { get }
  /// The quality of the item (e.g. number of stars)
  var quality: Int { get }
  /// The recipe for the item, which is an array of Item
  var recipe: [any Item]? { get }

  /// The background image for the item
  var backgroundImage: UIImage { get }
}

extension Item {
  /// The recipe for the item, which is an array of Item
  var recipe: [any Item]? { nil }
  /// The background image for the item based on its quality
  var backgroundImage: UIImage {
    UIImage(named: "Background/Quality_\(quality)_background")!
  }
}
