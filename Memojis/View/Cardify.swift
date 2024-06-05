//
//  Cardufy.swift
//  Memojis
//
//  Created by Alex Kuznetcov on 22.10.2021.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }
    
    var animatableData: Double {
        get { rotation }
        set { rotation = newValue }
    }
    
    private var rotation: Double
    
    func body(content: Content) -> some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: Constants.cornerRadius)
            if  rotation < 90 {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: Constants.lineWidth)
            } else {
                shape.fill()
            }
            content.opacity(rotation < 90 ? 1 : 0)
        }
        .rotation3DEffect(.degrees(rotation), axis: (0, 1, 0))
    }
    
	public struct Constants {
        
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
    }
}

extension View {
    
    func cardify(isFaceUp: Bool) -> some View {
        modifier(Cardify(isFaceUp: isFaceUp))
    }
}
