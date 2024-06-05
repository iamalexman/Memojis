//
//  MemojiView.swift
//  Memojis
//
//  Created by Alex Kuznetcov on 14.10.2021.
//

import SwiftUI

///```swift
///
///struct MemojiView: View {
///  var body: some View {
///    ZStack {
///       VStack {
///          game
///          HStack {
///            restart
///            shuffle
///          }
///       }
///       deck
///    }
///  }
///}
///
///```
struct MemojiView: View {
    
    @ObservedObject var model: MemojiViewModel
    
    @Namespace private var dealingNamespace
    
    @State private var isAnimating = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                game
                HStack {
                    restart
                    Spacer()
                    shuffle
                }
                .padding(.horizontal)
            }
            deck
        }
        .padding()
    }
    
    @State private var deal = Set<Int>()
    
    private func deal(_ card: MemojiViewModel.Card) {
        deal.insert(card.id)
    }
    
    private func isUndeal(_ card: MemojiViewModel.Card) -> Bool {
        !deal.contains(card.id)
    }
    
    private func dealAnimation(for card: MemojiViewModel.Card) -> Animation {
        var delay = 0.0
        if let index = model.cards.firstIndex(where: { $0.id == card.id }) {
            delay = Double(index) * (Constants.totalDealDuration / Double(model.cards.count))
        }
        return Animation.easeInOut(duration: Constants.dealDuration).delay(delay)
    }
    
    private func zIndex(of card: MemojiViewModel.Card) -> Double {
        -Double(model.cards.firstIndex(where: { $0.id == card.id }) ?? 0)
    }
    
    private var game: some View {
        Grid (items: model.cards, aspectRatio: 2 / 3) { card in
            if isUndeal(card) || (card.isMatched && !card.isFaceUp) {
                Color.clear
            } else {
                CardView(card: card)
                    .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                    .padding(4)
                    .transition(AnyTransition.asymmetric(insertion: .identity, removal: .scale))
                    .zIndex(zIndex(of: card))
                    .onTapGesture {
                        withAnimation {
                            model.choose(card)
                        }
                    }
            }
        }
        .foregroundColor(Constants.color)
    }
    
    var deck: some View {
        ZStack {
            ForEach(model.cards.filter(isUndeal)) { card in
                CardView(card: card)
                .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                .transition(AnyTransition.asymmetric(insertion: .opacity, removal: .identity))
                .zIndex(zIndex(of: card))
            }
        }
        .frame(width: Constants.undealtWidth, height: Constants.undealtHeight)
        .scaleEffect(isAnimating ? 1.0 : 0.9)
        .animation(.easeInOut(duration: 0.7).repeatForever(autoreverses: true), value: isAnimating)
        .foregroundColor(Constants.color)
        .onTapGesture {
            /// "Deal" cards
            for card in model.cards {
                withAnimation(dealAnimation(for: card)) {
                    deal(card)
                }
            }
        }
        .onAppear {
            isAnimating = true
        }
    }
    
    var shuffle: some View {
        Button("Shuffle") {
            withAnimation {
                model.shuffle()
            }
        }
        .font(.system(size: 25, weight: Font.Weight.semibold))
    }
    
    /// Description
    /// - Parameter label: "Restart"
    /// - Returns: Action: game.restart()
    var restart: some View {
        Button("Restart") {
            withAnimation {
                deal = []
                model.restart()
            }
        }
        .font(.system(size: 25, weight: Font.Weight.semibold))
    }
    
    private struct Constants {
        
        static let color = Color.red
        static let aspectRatio: CGFloat = 2 / 3
        static let dealDuration: Double = 0.5
        static let totalDealDuration: Double = 2
        static let undealtHeight: CGFloat = 90
        static let undealtWidth = undealtHeight * aspectRatio
    }
}

///
/// CardView contains card and animated state
///
///```swift
///
/// struct CardView: View {
///     var body: some View {
///         ZStack {
///             Group {
///                 Pie
///                 card.content
///             }
///         }
///     }
/// }
///
///```
///
struct CardView: View {
    
    let card: MemojiViewModel.Card
    @State private var animatedBonusRemaining = 0.0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Group {
                    if card.isConsumingBonusTime {
                        Pie(startAngle: Angle(degrees: 0 - 90),
                            endAngle: Angle(degrees: (1 - animatedBonusRemaining) * 360 - 90))
                            .onAppear {
                                animatedBonusRemaining = card.bonusRemaining
                                withAnimation(.linear(duration: card.bonusTimeRemaining)) {
                                    animatedBonusRemaining = 0
                                }
                            }
                    } else {
                        Pie(startAngle: Angle(degrees: 0 - 90),
                            endAngle: Angle(degrees: (1 - card.bonusRemaining) * 360 - 90))
                    }
                }
                .padding(5)
                .opacity(0.6)
                Text(card.content)
                    .rotationEffect(.degrees(card.isMatched ? 360 : 0))
                    .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: card.isMatched)
                    .font(Font.system(size: Constants.fontSize))
                    .scaleEffect(scale (thatFits: geometry.size))
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    private func scale(thatFits size: CGSize) -> CGFloat {
        min(size.width, size.height) / (Constants.fontSize / Constants.fontScale)
    }
    
    private struct Constants {
        
        static let fontScale:CGFloat = 0.7
        static let fontSize: CGFloat = 32
    }
}
