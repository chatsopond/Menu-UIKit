//
//  GradientFlowView.swift
//  Menu UIKit
//
//  Created by Chatsopon Deepateep on 22/3/23.
//

import SwiftUI
import MetalKit

struct GradientFlowView: UIViewRepresentable {
  typealias UIViewType = MTKView

  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }

  func makeUIView(context: Context) -> MTKView {
    let metalKitView = context.coordinator.metalKitView
    metalKitView.delegate = context.coordinator.gradientFlowRenderer
    metalKitView.preferredFramesPerSecond = 60
    metalKitView.framebufferOnly = false
    metalKitView.enableSetNeedsDisplay = false
    metalKitView.clearColor = MTLClearColorMake(0.0, 0.0, 0.0, 1.0)
    metalKitView.drawableSize = metalKitView.bounds.size
    return metalKitView
  }

  func updateUIView(_ uiView: MTKView, context: Context) {
    // Update the view if needed
  }

  class Coordinator {
    var gradientFlowRenderer: GradientFlowRenderer
    var metalKitView: MTKView
    init(_ parent: GradientFlowView) {
      guard let device = MTLCreateSystemDefaultDevice() else {
        fatalError("Failed to create device")
      }
      metalKitView = MTKView(frame: .zero, device: device)
      gradientFlowRenderer = GradientFlowRenderer(metalKitView: metalKitView)
    }
  }
}

struct GradientFlowView_Previews: PreviewProvider {
  static var previews: some View {
    GradientFlowView()
      .previewLayout(.fixed(width: 400, height: 400))
  }
}
