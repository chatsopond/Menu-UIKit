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
    private var gradientFlowView: GradientFlowView!
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

        // Call didMove(toParent:) on the hosting controller
        hostingController.didMove(toParent: self)
    }
}

