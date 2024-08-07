//
//  MemojisApp.swift
//  Memojis
//
//  Created by Alex Kuznetcov on 14.10.2021.
//

import SwiftUI

///
/// The entry point to the game
///
@main
struct MemojisApp: App {
    
    private let game = MemojiViewModel()
    
    var body: some Scene {
        WindowGroup {
            MemojiView(model: game)
        }
    }
}
