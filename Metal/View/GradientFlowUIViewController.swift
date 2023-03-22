//
//  GradientFlowUIViewController.swift
//  Menu UIKit
//
//  Created by Chatsopon Deepateep on 22/3/23.
//

import Foundation
import SwiftUI
import Anchorage

class GradientFlowUIViewController: UIViewController {
  // swiftlint:disable:next implicitly_unwrapped_optional
  private var gradientFlowView: GradientFlowView!
  // swiftlint:disable:next implicitly_unwrapped_optional
  private var hostingController: UIHostingController<GradientFlowView>!

  override func viewDidLoad() {
    super.viewDidLoad()

    gradientFlowView = GradientFlowView()
    hostingController = UIHostingController(rootView: gradientFlowView)

    // Add the hosting controller as a child view controller
    addChild(hostingController)
    view.addSubview(hostingController.view)

    // Configure the hosting controller's view using Anchorage
    hostingController.view.edgeAnchors == view.edgeAnchors
    hostingController.view.widthAnchor == view.widthAnchor
    hostingController.view.heightAnchor == view.heightAnchor


    // Call didMove(toParent:) on the hosting controller
    hostingController.didMove(toParent: self)
  }
}
