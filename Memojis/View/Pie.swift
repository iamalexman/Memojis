//
//  Pie.swift
//  Memojis
//
//  Created by Alex Kuznetcov on 21.10.2021.
//

import SwiftUI

/// Like a pie that's melting in front of your eyes by the second.
///
/// For example, initializing the structure for any inverted card will start an every second animation of a gradually disappearing circle of the selected duration
///
///```swift
///
/// Pie(startAngle: Angle(degrees: 0 - 90),
///     endAngle: Angle(degrees: (1 - card.bonusRemaining) * 360 - 90))
///
///```
///
/// - Parameters:
///    - startAngle: Start position for the line marking the decrease of the end time
///    - endAngle: End position for the line marking the decrease of the end time
///
/// - Important: Strictly clockwise ❗️
struct Pie: Shape {
    
    var startAngle: Angle
    var endAngle: Angle
    var clockwise = false
    
    var animatableData: AnimatablePair<Double, Double> {
        get { AnimatablePair(startAngle.radians, 
                             endAngle.radians) }
        set {
            startAngle = .radians(newValue.first)
            endAngle = .radians(newValue.second)
        }
    }
    
    ///
    /// Path method for animating
    /// a circle in a card
    ///
    /// - Parameter rect: Сard dimensions
    /// - Returns: Animation path
    /// 
    /// - note: It's the same as a watch 🕓
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min (rect.width, rect.height) / 2
        let start = CGPoint(
            x: center.x + radius * CGFloat(cos(startAngle.radians)),
            y: center.y + radius * CGFloat(sin(startAngle.radians))
        )
        var path = Path()
        path.move(to: center)
        path.addLine(to: start)
        path.addArc(center: center,
                    radius: radius,
                    startAngle: startAngle,
                    endAngle: endAngle,
                    clockwise: !clockwise)
        path.addLine(to:center)
        return path
    }
}
