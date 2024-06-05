//
//  MemojiViewModel.swift
//  Memojis
//
//  Created by Alex Kuznetcov on 22.10.2021.
//

import SwiftUI
///
/// MemojiViewModel has an emojis card set
///
class MemojiViewModel: ObservableObject {
    
    typealias Card = MemojiModel<String>.Card
    
    /// Emoji set to create pairs of cards based on it
    ///
    /// ```
    /// Emojis:
    /// 🚲 🚂 🚁 🚜 🚕 🏎 🚑 🚓
    /// ⛵️ 🛸 🛶 🚌 🏍 🛺 🚡 🛵
    /// 🚒 ✈️ 🚀 🚈 🚗 🚚 🚇 🚙
    ///
    /// ```
    public static var emojis = [
		"🚲", "🚂", "🚁", "🚜", "🚕", "🏎", "🚑", "🚓", "🚒", "✈️", "🚀",
		"⛵️","🛸","🛶","🚌","🏍","🛺","🚡","🛵","🚗","🚚","🚇","🚙","🚈"
    ]
    
    /// The main func allows you to create a new game
    private static func createMemoryGame() -> MemojiModel<String> {
        MemojiModel<String>(numberOfPairsOfCards: 8) { pairIndex in
            emojis.shuffle()
            let newEmojisSet = emojis
            return newEmojisSet[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()
    
    /// Cards Array
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
        model = MemojiViewModel.createMemoryGame()
    }
}
