//
//  Coordinator.swift
//  Menu UIKit
//
//  Created by Chatsopon Deepateep on 23/3/23.
//

import UIKit

protocol Coordinator: AnyObject {
  var childCoordinators: [Coordinator] { get set }
  var navigationController: UINavigationController? { get set }

  func start()
}
