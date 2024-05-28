# ``Memojis``

A classic card matching game.

@Metadata {
    @PageImage(purpose: icon,
               source: "MemojisDoc",
               alt: "A technology icon representing the Memojis application")
    @PageColor(red)
}

## Overview

Test your brain! Flip the cards to find a maching emoji pair.

[View source](https://github.com/iamalexman/Memojis)

@Row {
    @Column {
        @Video(poster: "screenshot", 
               source: "gameplay",
               alt: "")
    }
    @Column(size: 2) {
        ## Gameplay
        
        The player turns over 2 cards. 
        
        If the pictures match, the player keeps the cards and tries again for another match. 
        
        If they do not match the cards are turned over again and the player to the left takes a turn.
        
        Player must try to remember where he has seen cards, so the player can use them to make a match.
        
        ## Another options:
        
        The player can tap to restart the game.
        
        The player can shuffle the cardset&
    }
}

## Topics

### Creating

- ``MemojisApp``
- ``CardView``
