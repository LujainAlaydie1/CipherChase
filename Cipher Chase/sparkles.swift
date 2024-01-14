//
//  sparkles.swift
//  Cipher Chase
//
//  Created by Lujain Alaydie on 25/11/2023.
//

import SwiftUI
// To use this shape, just add it to your SwiftUI View:
// Vector().fill().frame(width: 14, height: 15)

struct sparkle: Shape {
        func path(in rect: CGRect) -> Path {
                var path = Path()
                let width = rect.size.width
                let height = rect.size.height
                path.move(to: CGPoint(x: 0.5000193353*width, y: height))
                path.addLine(to: CGPoint(x: 0.6350657616*width, y: 0.6350410525*height))
                path.addLine(to: CGPoint(x: width, y: 0.4999998807*height))
                path.addLine(to: CGPoint(x: 0.6350657616*width, y: 0.3649589475*height))
                path.addLine(to: CGPoint(x: 0.5000193353*width, y: 0))
                path.addLine(to: CGPoint(x: 0.3649733865*width, y: 0.3649589475*height))
                path.addLine(to: CGPoint(x: 0, y: 0.4999998807*height))
                path.addLine(to: CGPoint(x: 0.3649733865*width, y: 0.6350410525*height))
                path.addLine(to: CGPoint(x: 0.5000193353*width, y: height))
                path.closeSubpath()
                return path
        }
}

// To use this shape, just add it to your SwiftUI View:
// smallSparkle().fill().frame(width: 8, height: 8)

struct smallSparkle: Shape {
        func path(in rect: CGRect) -> Path {
                var path = Path()
                let width = rect.size.width
                let height = rect.size.height
                path.move(to: CGPoint(x: 0.5*width, y: 0))
                path.addLine(to: CGPoint(x: 0.3649283353*width, y: 0.3649283353*height))
                path.addLine(to: CGPoint(x: 0, y: 0.5*height))
                path.addLine(to: CGPoint(x: 0.3649283353*width, y: 0.6350716647*height))
                path.addLine(to: CGPoint(x: 0.5*width, y: height))
                path.addLine(to: CGPoint(x: 0.6350716647*width, y: 0.6350716647*height))
                path.addLine(to: CGPoint(x: width, y: 0.5*height))
                path.addLine(to: CGPoint(x: 0.6350716647*width, y: 0.3649283353*height))
                path.addLine(to: CGPoint(x: 0.5*width, y: 0))
                path.closeSubpath()
                return path
        }
}
