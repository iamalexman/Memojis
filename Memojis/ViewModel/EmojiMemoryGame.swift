//
//  EmojiMemoryGame.swift
//  Memojis
//
//  Created by Alex Smith on 22.10.2021.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
	
    private static let emojis = [
		"🚲", "🚂", "🚁", "🚜", "🚕", "🏎", "🚑", "🚓", "🚒", "✈️", "🚀",
		"⛵️","🛸","🛶","🚌","🏍","🛺","🚡","🛵","🚗","🚚","🚇","🚙","🚈"
	]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 8) { pairIndex in
            emojis [pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame ()
    
    var cards: Array<Card> {
        model.cards
    }
    
    // MARK: Intents
    
    /// Intents
    ///
    /// Allows you to select the first and second card in a pair
    func choose (_ card: Card) {
        model.choose(card)
    }
    
    /// Intents
    ///
    /// Allows you to shuffle cards on the field
    func shuffle() {
        model.shuffle()
    }
    
    /// Intents
    ///
    /// Allows you to restart the game
    func restart() {
        model = EmojiMemoryGame.createMemoryGame()
    }
}
