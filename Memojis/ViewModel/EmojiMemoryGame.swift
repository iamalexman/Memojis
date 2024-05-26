//
//  EmojiMemoryGame.swift
//  Memojis
//
//  Created by Alex Smith on 22.10.2021.
//

import SwiftUI
///
/// Class EmojiMemoryGame has an emojis card set
///
class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    ///
    /// 🚲 🚂 🚁 🚜 🚕 🏎 🚑 🚓 🚒 ✈️ 🚀
    /// ⛵️🛸🛶🚌🏍🛺🚡🛵 🚗 🚚 🚇 🚙 🚈
    ///
    public static let emojis = [
		"🚲", "🚂", "🚁", "🚜", "🚕", "🏎", "🚑", "🚓", "🚒", "✈️", "🚀",
		"⛵️","🛸","🛶","🚌","🏍","🛺","🚡","🛵","🚗","🚚","🚇","🚙","🚈"
	]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 8) { pairIndex in
            emojis [pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        model.cards
    }
    
    // MARK: Intents
    ///
    /// ### Intents
    /// func choose
    ///
    /// Allows you to select the first and second card in a pair
    func choose (_ card: Card) {
        model.choose(card)
    }
    
    /// func shuffle
    ///
    /// Allows you to shuffle cards on the field
    func shuffle() {
        model.shuffle()
    }
    
    /// func restart
    ///
    /// Allows you to restart the game
    func restart() {
        model = EmojiMemoryGame.createMemoryGame()
    }
}
