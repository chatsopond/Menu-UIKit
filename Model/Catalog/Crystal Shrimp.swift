//
//  CrystalShrimp.swift
//  Menu UIKit
//
//  Created by Chatsopon Deepateep on 24/3/23.
//
// swiftlint:disable line_length

import Foundation

struct CrystalShrimpItem: Item {
  let id = String(describing: CrystalShrimpItem.self)
  let imageName = "Item/Crystal Shrimp"
  let title = "Crystal Shrimp"
  let description = "One of Liyue's traditional snacks. The stuffing is taken from whole fresh shrimp, and the glistening quality of the flour can be guessed at from the translucence of the outer skin. Has a springy, tasty chew."
  let travelerDescription = "Crystal Shrimp is a food item that the player can cook. The recipe for Crystal Shrimp is obtainable from Chef Mao at Wanmin Restaurant for 2,500 Mora after reaching Adventure Rank 20."
  let quality = 2
  let recipe: [any Item]? = [RiceItem(), ShrimpMeatItem(), CarrotItem()]
}
