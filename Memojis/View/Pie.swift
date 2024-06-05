//
//  Pie.swift
//  Memojis
//
//  Created by Alex Kuznetcov on 21.10.2021.
//

import SwiftUI

///
/// - Parameters:
///    - startAngle: Angle
///    - endAngle: Angle
///    - clockwise: Bool
///
struct Pie: Shape {
    
    var startAngle: Angle
    var endAngle: Angle
    var clockwise = false
    
    var animatableData: AnimatablePair<Double, Double> {
        get { AnimatablePair(startAngle.radians, endAngle.radians) }
        set {
            startAngle = .radians(newValue.first)
            endAngle = .radians(newValue.second)
        }
    }
    
    ///
    /// Path method for animating
    /// a circle in a card
    ///
    /// - Note: It's the same as a watch 🕓
    ///
    ///```swift
    ///
    /// `The Description` will be here, maybe
    ///
    /// - Parameter rect: CGRect
    /// - Returns: Path
    ///
    /// ```
    /// - Important: Strictly clockwise ❗️
    ///
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min (rect.width,rect.height) / 2
        let start = CGPoint(
            x: center.x + radius * CGFloat(cos(startAngle.radians)),
            y: center.y + radius * CGFloat(sin(startAngle.radians))
        )
        var p = Path()
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(center: center,
                 radius: radius,
                 startAngle: startAngle,
                 endAngle: endAngle,
                 clockwise: !clockwise)
        p.addLine (to:center)
        return p
    }
}
