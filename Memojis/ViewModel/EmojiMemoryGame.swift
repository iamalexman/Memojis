//
//  EmojiMemoryGame.swift
//  Memojis
//
//  Created by Alex Kuznetcov on 22.10.2021.
//

import SwiftUI
///
/// Class EmojiMemoryGame has an emojis card set
///
class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    /// A Set of emoji to generate pairs of cards based on them
    ///
    /// ```
    /// public static let emojis = [
    /// 🚲 🚂 🚁 🚜 🚕 🏎 🚑 🚓 🚒 ✈️ 🚀
    /// ⛵️🛸🛶🚌🏍🛺🚡🛵 🚗 🚚 🚇 🚙 🚈
    /// ]
    /// ```
    public static let emojis = [
		"🚲", "🚂", "🚁", "🚜", "🚕", "🏎", "🚑", "🚓", "🚒", "✈️", "🚀",
		"⛵️","🛸","🛶","🚌","🏍","🛺","🚡","🛵","🚗","🚚","🚇","🚙","🚈"
	]
    
    /// The main func allows you to create a new game
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 8) { pairIndex in
            emojis [pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()
    
    /// A cards Array
    ///
    /// ```
    /// var cards: Array<Card> {
    ///     model.cards
    /// }
    /// ```
    var cards: Array<Card> {
        model.cards
    }
    
    // MARK: Intents
    
    /// ### Intents
    ///
    /// The choose func
    ///
    /// Allows you to select the first and second card in a pair
    /// ```
    /// func choose (_ card: Card) {
    ///     model.choose(card)
    /// }
    /// ```
    func choose (_ card: Card) {
        model.choose(card)
    }
    
    /// The shuffle func
    ///
    /// Allows you to shuffle cards on the field
    /// ```
    /// func shuffle() {
    ///     model.shuffle()
    /// }
    /// ```
    func shuffle() {
        model.shuffle()
    }
    
    /// The restart func
    ///
    /// Allows you to restart the game
    /// ```
    /// func restart() {
    ///     model = $.createMemoryGame()
    /// }
    /// ```
    func restart() {
        model = EmojiMemoryGame.createMemoryGame()
    }
}
