//
//  shader.metal
//  Menu UIKit
//
//  Created by Chatsopon Deepateep on 22/3/23.
//

#include <metal_stdlib>
using namespace metal;

// Vertex input
struct VertexIn {
  float4 position [[attribute(0)]];
};

// Vertex output
struct VertexOut {
  float2 texCoord;
  float4 position [[position]];
};

// Vertex shader
vertex VertexOut vertexShader(VertexIn input [[stage_in]]) {
  VertexOut output;
  output.position = input.position;
  output.texCoord = input.position.xy;
  return output;
}

// Fragment shader
fragment float4 fragmentShader(VertexOut input [[stage_in]],
                               constant float4 &color1 [[buffer(0)]],
                               constant float4 &color2 [[buffer(1)]],
                               constant float4 &color3 [[buffer(2)]],
                               constant float4 &color4 [[buffer(3)]],
                               constant float &time [[buffer(4)]]) {
  // Input texture coordinates
  float2 uv = input.texCoord;

  // Gradient flow
  float frequency = 2.0;
  float speed = 0.5;
  float wave = sin(uv.y * frequency + time * speed);
  float gradient = smoothstep(-1.0, 1.0, wave);

  // Interpolate between colors based on gradient value
  float4 color12 = mix(color1, color2, gradient);
  float4 color34 = mix(color3, color4, gradient);
  float4 finalColor = mix(color12, color34, uv.x);

  return finalColor;
}
