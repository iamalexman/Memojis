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
    /// ```swift
    ///
    /// Emojis:
    /// 
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
    private static func createMemojiGame() -> MemojiModel<String> {
        MemojiModel<String>(numberOfPairsOfCards: 8) { pairIndex in
            emojis.shuffle()
            let newEmojisSet = emojis
            return newEmojisSet[pairIndex]
        }
    }
    
    @Published private var model = createMemojiGame()
    
    /// 
    /// Cards Array
    ///
    /// ```swift
    ///
    /// var cards: Array<Card> {
    ///     model.cards
    /// }
    /// 
    /// ```
    ///
    var cards: Array<Card> {
        model.cards
    }
    
    // MARK: Intents
    
    /// 
    /// ### Intents
    ///
    /// Choose func
    ///
    /// Allows you to select the first and second card in a pair
    ///
    /// ```swift
    ///
    /// func choose (_ card: Card) {
    ///     model.choose(card)
    /// }
    ///
    /// ```
    ///
    func choose (_ card: Card) {
        model.choose(card)
    }
    
    /// 
    /// Shuffle func
    ///
    /// Allows you to shuffle cards on the field
    ///
    /// ```swift
    ///
    /// func shuffle() {
    ///     model.shuffle()
    /// }
    ///
    /// ```
    ///
    func shuffle() {
        model.shuffle()
    }
    
    /// 
    /// Restart func
    ///
    /// Allows you to restart the game
    /// 
    /// ```swift
    ///
    /// func restart() {
    ///     model.createMemojiGame()
    /// }
    ///
    /// ```
    ///
    func restart() {
        model = MemojiViewModel.createMemojiGame()
    }
}
