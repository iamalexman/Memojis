//
//  MemojiViewModel.swift
//  Memojis
//
//  Created by Alex Kuznetcov on 22.10.2021.
//

import SwiftUI

///
/// # ``MemojiViewModel``
///
/// Class `MemojiViewModel` has an emojis card set
///
/// Base class
///
/// [Overview link](https://iamalexman.github.io/Memojis/documentation/memojis/memojiviewmodel)
///
/// - note: The ViewModel contains a private method and a model to start the game, implementation details can be found in the code
///
/// ## Topics
///
/// ### Emojis Card Set
///
/// - ``Card``
/// - ``cards``
/// - ``emojis``
///
/// ### Basic Game methods
///
/// - ``choose(_:)``
/// - ``shuffle()``
/// - ``restart()``
class MemojiViewModel: ObservableObject {
    
    /// Typealias ``Card``
    typealias Card = MemojiModel<String>.Card
    
    /// Emoji set to create pairs of cards based on it
    ///
    /// Basic Emoji Transportation Set
    ///
    /// - Important: Only one set of cards is presented, but you can expand the sets with other themes
    ///
    /// ```swift
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
    
    /// Emoji Array  ``cards``
    var cards: Array<Card> {
        model.cards
    }
    
    // MARK: Intents

    ///
    /// Choose func allows you to select the first and second card in a pair
    ///
    /// - Method ``choose(_:)``
    ///
    /// - Parameter card: The directly selected card
    ///
    func choose (_ card: Card) {
        model.choose(card)
    }
    
    /// 
    /// Shuffle func allows you to shuffle cards on the field
    ///
    /// - Method ``shuffle()``
    ///
    func shuffle() {
        model.shuffle()
    }
    
    /// 
    /// Restart func allows you to restart the game
    ///
    /// - Method ``restart()``
    ///
    func restart() {
        model = MemojiViewModel.createMemojiGame()
    }
}
