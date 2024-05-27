# Rich Documentation for the Memojis Application

### Swift-DocC + GitHub Actions + GitHub Pages

![Screenshot 2024-05-26 at 13 31 56](https://github.com/iamalexman/Memojis/assets/61458847/23fe6ffa-3082-4f65-9fbd-392fe1c0b05f)

1. Make a rich documentation for your project or framework
   - Make the header and titles
   - Change color and font
   - Use tables, links, pictures and videos to make your documentation
     
3. Export it using GitHub Actions
   - Make a script file 
   - Write a build rule to your .doccacrchive
   - Write a transforming rule to transform archive to static site
   - Make a redirect from .docs directory
     
4. Publish it as a static site on the GitHub Pages
   - Choose the GitHub Actions source for your build and deployment
   - Make a directory for your future workflow .github/workflows on the root repo
   - Configure YAML file and rules for your build and deployment jobs 
   
>
> This [documentation](https://iamalexman.github.io/Memojis/documentation/memojis) is based on a project I did studying Swift from the [Stanford's CS193p course, Developing Applications for iOS.](https://cs193p.sites.stanford.edu/about-cs193p)
> 
> The cource explains the fundamentals of how to build a memory game for iPhone and iPad using SwiftUI and MVVM architecture pattern.
> 

##

### Memojis Application

Test your brain! Flip the cards to find a maching emoji pair.

#### Rules and gameplay
        
- The player turns over 2 cards. 
- If the pictures match, the player keeps the cards and tries again for another match. 
- If they do not match the cards are turned over again and the player might try again.
- Player must try to remember where he has seen cards, so the player can use them to make a match.
        
#### Another options:

- The player can tap to restart the game.
- The player can shuffle the cardset

![DeskScreen](https://github.com/iamalexman/Memojis/assets/61458847/85b2c358-a34e-4daf-bf09-3b8d3a0a5f5e)
![GameScreen](https://github.com/iamalexman/Memojis/assets/61458847/8493c804-8a7d-4427-a58b-6f619606b671)
