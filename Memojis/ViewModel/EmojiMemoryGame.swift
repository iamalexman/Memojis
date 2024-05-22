//
//  EmojiMemoryGame.swift
//  Memojis
//
//  Created by Alex Smith on 22.10.2021.
//

//VIEW MODEL

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
    
    func choose (_ card: Card) {
        model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func restart() {
        model = EmojiMemoryGame.createMemoryGame()
    }
}
