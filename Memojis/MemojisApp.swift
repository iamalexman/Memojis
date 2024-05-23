//
//  MemojisApp.swift
//  Memojis
//
//  Created by Alex Smith on 14.10.2021.
//

import SwiftUI
/// A set of card emoji
///
/// 🚲 🚂 🚁 🚜 🚕 🏎 🚑 🚓 🚒 ✈️ 🚀
/// ⛵️🛸🛶🚌🏍🛺🚡🛵 🚗 🚚 🚇 🚙 🚈
///
@main
struct MemojisApp: App {
    
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
