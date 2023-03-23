//
//  GradientFlowUINavigationController.swift
//  Menu UIKit
//
//  Created by Chatsopon Deepateep on 23/3/23.
//

import UIKit
import Anchorage

/// This class represents a custom UINavigationController that uses a GradientFlowUIViewController as a background.
class GradientFlowUINavigationController: UINavigationController {
  /// The GradientFlowUIViewController used as the background.
  private let gradientFlowViewController = GradientFlowUIViewController()

  override func viewDidLoad() {
    super.viewDidLoad()

    // Add the GradientFlowUIViewController as a child view controller.
    addChild(gradientFlowViewController)
    view.insertSubview(gradientFlowViewController.view, at: 0)
    gradientFlowViewController.didMove(toParent: self)

    // Set up the constraints for the gradientFlowViewController's view.
    gradientFlowViewController.view.translatesAutoresizingMaskIntoConstraints = false
    gradientFlowViewController.view.edgeAnchors == view.edgeAnchors

    // Set the navigation bar appearance.
    navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationBar.shadowImage = UIImage()
    navigationBar.isTranslucent = true
  }
}
