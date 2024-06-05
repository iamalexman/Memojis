//
//  MemojiModel.swift
//  Memojis
//
//  Created by Alex Kuznetcov on 22.10.2021.
//

import Foundation
import SwiftUI

///```swift
///
///struct MemojiModel<CardContent> where CardContent: Equatable
///
///```
///
struct MemojiModel<CardContent> where CardContent: Equatable {
    
    private(set) var cards: Array<Card>
    private(set) var score = 0
    
    public var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter ({ cards[$0].isFaceUp }).oneAndOnly }
        set { cards.indices.forEach { cards[$0].isFaceUp = $0 == newValue }}
    }
  
    mutating func choose (_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched {
            if let potantialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potantialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potantialMatchIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    init(numberOfPairsOfCards: Int, 
         createCardContent: (Int) -> CardContent) {
        
        cards = []
        
        /// Add numberOfPairsOfCards * 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        
        var isFaceUp = false {
            didSet {
                isFaceUp
                ? startUsingBonusTime()
                : stopUsingBonusTime()
            }
        }
        
        var isMatched = false {
            didSet {
                stopUsingBonusTime()
            }
        }
        
        let content: CardContent
        let id: Int
        
        // MARK: - Bonus Time
        
        /// This could give matching bonus points
        /// if the user matches the card
        /// before a certain amount of time passes during which the card is face up
        ///
        /// Can be zero which means "no bonus available" for this card
        var bonusTimeLimit: TimeInterval = 6
        
        /// How long this card has ever been face up
        public var faceUpTime: TimeInterval {
            if let lastFaceUpDate {
                return pastFaceUpTime + Date().timeIntervalSince(lastFaceUpDate)
            } else {
                return pastFaceUpTime
            }
        }
        
        /// The last time this card was turned face up (and is still face up)
        var lastFaceUpDate: Date?
        
        /// The accumulated time this card has been face up in the past
        /// (i.e. not including the current time it's been face up if it is currently so)
        var pastFaceUpTime: TimeInterval = 0
        
        /// How much time left before the bonus opportunity runs out
        var bonusTimeRemaining: TimeInterval {
            max(0, bonusTimeLimit - faceUpTime)
        }
        
        /// Percentage of the bonus time remaining
        var bonusRemaining: Double {
            (bonusTimeLimit > 0 && bonusTimeRemaining > 0)
            ? bonusTimeRemaining / bonusTimeLimit
            : 0
        }
        
        /// Whether the card was matched during the bonus time period
        var hasEarnedBonus: Bool {
            isMatched && bonusTimeRemaining > 0
        }
        
        /// Whether we are currently face up, unmatched and have not yet used up the bonus window
        var isConsumingBonusTime: Bool {
            isFaceUp && !isMatched && bonusTimeRemaining > 0
        }
        
        /// Called when the card transitions to face up state
        public mutating func startUsingBonusTime() {
            if isConsumingBonusTime, lastFaceUpDate == nil {
                lastFaceUpDate = Date()
            }
        }
        
        /// Called when the card goes back face down (or gets matched)
        public mutating func stopUsingBonusTime() {
            pastFaceUpTime = faceUpTime
            lastFaceUpDate = nil
        }
    }
}

extension Array {
    var oneAndOnly: Element? {
        count == 1
        ? first
        : nil
    }
}
