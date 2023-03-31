//
//  Coordinator.swift
//  Menu UIKit
//
//  Created by Chatsopon Deepateep on 23/3/23.
//
// swiftlint:disable implicitly_unwrapped_optional

import UIKit

/// The Coordinator protocol defines the structure and behavior of a coordinator in the application.
/// It is responsible for managing navigation and communication between view controllers.
protocol Coordinator: AnyObject {
  /// The parent coordinator, used for communication with the parent coordinator (if any).
  var parentCoordinator: Coordinator? { get }

  /// An array of child coordinators, used to manage the hierarchy of coordinators.
  var childCoordinators: [Coordinator] { get set }

  /// The navigation controller responsible for managing the view controllers in the navigation stack.
  var navigationController: UINavigationController! { get set }

  /// The start method is responsible for starting the coordinator and presenting the initial view controller.
  func start()

  /// The method is responsible for removing the specified child coordinator from the childCoordinators array.
  /// - Parameter coordinator: The child coordinator to be removed.
  func removeChildCoordinator(_ coordinator: Coordinator)

  /// A closure that is executed when the coordinator completes its tasks and needs to be removed from the parent.
  var onComplete: (() -> Void)? { get set }
}

extension Coordinator {
  /// The default implementation of the `removeChildCoordinator(_:)` method for the Coordinator protocol.
  /// It removes the specified child coordinator from the `childCoordinators` array.
  /// - Parameter coordinator: The child coordinator to be removed.
  func removeChildCoordinator(_ coordinator: Coordinator) {
    childCoordinators = childCoordinators.filter { $0 !== coordinator }
  }
}
