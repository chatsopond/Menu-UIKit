//
//  Rice.swift
//  Menu UIKit
//
//  Created by Chatsopon Deepateep on 24/3/23.
//
// swiftlint:disable line_length

import Foundation

struct RiceItem: Item {
  let id = String(describing: RiceItem.self)
  let imageName = "Item/Rice"
  let title = "Rice"
  let description = """
A grain crop commonly found in Teyvat. People of all walks of life enjoy its distinct grainy texture. As the saying goes, "The same kind of rice can feed one hundred kinds of people."
"""
  let travelerDescription = "Rice is a Cooking Ingredient item used in recipes to create Food items."
  let quality = 1
}
