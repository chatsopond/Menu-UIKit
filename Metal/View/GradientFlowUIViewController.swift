//
//  GradientFlowUIViewController.swift
//  Menu UIKit
//
//  Created by Chatsopon Deepateep on 22/3/23.
//
// swiftlint:disable implicitly_unwrapped_optional

import Foundation
import SwiftUI
import Anchorage
import MetalKit

class GradientFlowUIViewController: UIViewController {
  private var metalKitView: MTKView!
  private var gradientFlowRenderer: GradientFlowRenderer!

  override func viewDidLoad() {
    super.viewDidLoad()
    guard let device = MTLCreateSystemDefaultDevice() else {
      fatalError("Failed to create device")
    }
    self.metalKitView = MTKView(frame: .zero, device: device)
    self.gradientFlowRenderer = GradientFlowRenderer(metalKitView: metalKitView)
    metalKitView.delegate = gradientFlowRenderer
    metalKitView.preferredFramesPerSecond = 60
    metalKitView.framebufferOnly = false
    metalKitView.enableSetNeedsDisplay = false
    metalKitView.clearColor = MTLClearColorMake(0.0, 0.0, 0.0, 1.0)
    metalKitView.drawableSize = metalKitView.bounds.size

    self.view.addSubview(metalKitView)
    self.metalKitView.edgeAnchors == self.view.edgeAnchors
  }
}
