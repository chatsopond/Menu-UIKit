//
//  GradientFlowRenderer.swift
//  Menu UIKit
//
//  Created by Chatsopon Deepateep on 22/3/23.
//

import MetalKit

class GradientFlowRenderer: NSObject, MTKViewDelegate {
  private let vertexData: [Float] = [
    -1,  1, 0, 1,
     1,  1, 0, 1,
    -1, -1, 0, 1,
     1, -1, 0, 1
  ]

  private var device: MTLDevice!
  private var commandQueue: MTLCommandQueue!
  private var pipelineState: MTLRenderPipelineState!
  private var vertexBuffer: MTLBuffer!
  private var indexBuffer: MTLBuffer!
  private var timeBuffer: MTLBuffer!
  private var colorBuffers: [MTLBuffer]!
  private var startTime = Date()

  init(metalKitView: MTKView) {
    super.init()

    guard let device = MTLCreateSystemDefaultDevice() else {
      fatalError("Failed to create Metal device.")
    }
    self.device = device
    metalKitView.device = device

    commandQueue = device.makeCommandQueue()

    let library = device.makeDefaultLibrary()
    let vertexFunction = library?.makeFunction(name: "vertexShader")
    let fragmentFunction = library?.makeFunction(name: "fragmentShader")

    let pipelineDescriptor = MTLRenderPipelineDescriptor()
    pipelineDescriptor.label = "GradientFlow"
    pipelineDescriptor.vertexFunction = vertexFunction
    pipelineDescriptor.fragmentFunction = fragmentFunction
    pipelineDescriptor.colorAttachments[0].pixelFormat = metalKitView.colorPixelFormat

    let vertexDescriptor = MTLVertexDescriptor()
    vertexDescriptor.attributes[0].format = .float4
    vertexDescriptor.attributes[0].offset = 0
    vertexDescriptor.attributes[0].bufferIndex = 0
    vertexDescriptor.layouts[0].stride = MemoryLayout<Float>.stride * 4

    pipelineDescriptor.vertexDescriptor = vertexDescriptor

    do {
      pipelineState = try device.makeRenderPipelineState(descriptor: pipelineDescriptor)
    } catch {
      fatalError("Failed to create pipeline state: \(error.localizedDescription)")
    }

    vertexBuffer = device.makeBuffer(
      bytes: &vertexData,
      length: vertexData.count * MemoryLayout<Float>.stride)
    vertexBuffer.label = "Vertices"

    var color1 = SIMD4<Float>(1, 0, 0, 1)
    var color2 = SIMD4<Float>(0, 1, 0, 1)
    var color3 = SIMD4<Float>(0, 0, 1, 1)
    var color4 = SIMD4<Float>(1, 1, 0, 1)

    let colorBufferSize = MemoryLayout<SIMD4<Float>>.stride
    colorBuffers = [
      device.makeBuffer(bytes: &color1, length: colorBufferSize, options: [])!,
      device.makeBuffer(bytes: &color2, length: colorBufferSize, options: [])!,
      device.makeBuffer(bytes: &color3, length: colorBufferSize, options: [])!,
      device.makeBuffer(bytes: &color4, length: colorBufferSize, options: [])!
    ]

    timeBuffer = device.makeBuffer(length: MemoryLayout<Float>.stride, options: [])
  }

  func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
    // Handle drawable size change if needed
  }

  func draw(in view: MTKView) {
    guard let drawable = view.currentDrawable,
          let renderPassDescriptor = view.currentRenderPassDescriptor,
          let commandBuffer = commandQueue.makeCommandBuffer(),
          let renderEncoder = commandBuffer.makeRenderCommandEncoder(descriptor: renderPassDescriptor) else {
      return
    }

    renderEncoder.label = "GradientFlowEncoder"
    renderEncoder.pushDebugGroup("DrawGradientFlow")
    renderEncoder.setRenderPipelineState(pipelineState)
    renderEncoder.setVertexBuffer(vertexBuffer, offset: 0, index: 0)

    for (index, buffer) in colorBuffers.enumerated() {
      renderEncoder.setFragmentBuffer(buffer, offset: 0, index: index)
    }

    // Update time and set time buffer
    let currentTime = Date()
    var time = Float(currentTime.timeIntervalSinceReferenceDate - startTime.timeIntervalSinceReferenceDate)
    memcpy(timeBuffer.contents(), &time, MemoryLayout<Float>.size)
    renderEncoder.setFragmentBuffer(timeBuffer, offset: 0, index: 4)

    renderEncoder.drawPrimitives(type: .triangleStrip, vertexStart: 0, vertexCount: vertexData.count / 4)

    renderEncoder.popDebugGroup()
    renderEncoder.endEncoding()
    commandBuffer.present(drawable)
    commandBuffer.commit()
  }
}
