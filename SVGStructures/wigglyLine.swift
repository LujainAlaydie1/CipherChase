//
//  wigglyLine.swift
//  Cipher Chase
//
//  Created by Lujain Alaydie on 10/01/2024.
//

import Foundation
import SwiftUI
struct wigglyLine: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            let width = rect.size.width
            let height = rect.size.height
            
            // Your path points
            path.move(to: CGPoint(x: 0.4749 * width, y: 0.00771 * height))
            path.addCurve(to: CGPoint(x: 0.18726 * width, y: 0.27121 * height), control1: CGPoint(x: 0.28314 * width, y: 0.04242 * height), control2: CGPoint(x: 0.07915 * width, y: 0.17866 * height))
            path.addCurve(to: CGPoint(x: 0.96718 * width, y: 0.33676 * height), control1: CGPoint(x: 0.41701 * width, y: 0.46788 * height), control2: CGPoint(x: 0.90053 * width, y: 0.18766 * height))
            path.addCurve(to: CGPoint(x: 0.05405 * width, y: 0.58997 * height), control1: CGPoint(x: 1.12116 * width, y: 0.68123 * height), control2: CGPoint(x: 0.2834 * width, y: 0.38175 * height))
            path.addCurve(to: CGPoint(x: 0.62355 * width, y: 0.82519 * height), control1: CGPoint(x: -0.08585 * width, y: 0.71699 * height), control2: CGPoint(x: 0.15058 * width, y: 0.88303 * height))
            path.addCurve(to: CGPoint(x: 0.93243 * width, y: 0.99743 * height), control1: CGPoint(x: 1.00193 * width, y: 0.77892 * height), control2: CGPoint(x: 0.98069 * width, y: 0.90317 * height))
            
            return path
                .strokedPath(StrokeStyle(lineWidth: 6)) // Adjust line width as needed
            
        }
    }
