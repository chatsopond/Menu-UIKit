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

float2 hash(float2 p) {
  float2 result = float2(dot(p, float2(127.1, 311.7)), dot(p, float2(269.5, 183.3)));
  return fract(sin(result) * 758.5453);
}

float noise(float2 p) {
  float2 i = floor(p);
  float2 f = fract(p);
  float2 u = f * f * (3.0 - 2.0 * f);

  float2 i00 = i;
  float2 i10 = i + float2(1.0, 0.0);
  float2 i01 = i + float2(0.0, 1.0);
  float2 i11 = i + float2(1.0, 1.0);

  float n = mix(mix(dot(-1.0 + 2.0 * hash(i00), f - float2(0.0, 0.0)),
                    dot(-1.0 + 2.0 * hash(i10), f - float2(1.0, 0.0)), u.x),
                mix(dot(-1.0 + 2.0 * hash(i01), f - float2(0.0, 1.0)),
                    dot(-1.0 + 2.0 * hash(i11), f - float2(1.0, 1.0)), u.x), u.y);
  return 0.5 + 0.5 * n;
}

float2x2 Rot(float a) {
  float s = sin(a);
  float c = cos(a);
  return float2x2(c, -s, s, c);
}

float radians(float degrees) {
  return degrees * (3.14159265358979323846 / 180.0);
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
  float speed = 0.05;
  float n = noise(sin(speed * 1000) * uv);
  float wave = n * sin(uv.y * frequency + time * speed);
  float gradient = n * smoothstep(-1.0, 1.0, wave);

  // Interpolate between colors based on gradient value
  float4 color12 = mix(color1, color2, gradient);
  float4 color34 = mix(color3, color4, gradient);
  float4 finalColor = mix(color12, color34, uv.x);

  return finalColor;
}
