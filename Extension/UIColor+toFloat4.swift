//
//  UIColor+toFloat4.swift
//  Menu UIKit
//
//  Created by Chatsopon Deepateep on 22/3/23.
//

import UIKit
import simd

extension UIColor {
  func toFloat4() -> SIMD4<Float> {
    var r: CGFloat = 0
    var g: CGFloat = 0
    var b: CGFloat = 0
    var a: CGFloat = 0
    self.getRed(&r, green: &g, blue: &b, alpha: &a)
    return SIMD4<Float>(Float(r), Float(g), Float(b), Float(a))
  }
}
