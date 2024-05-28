# Rich Documentation for the Memojis Application

### Swift-DocC + GitHub Actions + GitHub Pages

![Screenshot 2024-05-26 at 13 31 56](https://github.com/iamalexman/Memojis/assets/61458847/23fe6ffa-3082-4f65-9fbd-392fe1c0b05f)

1. Craft a rich documentation of your project or framework
   - Make a header and titles using `Markdown` syntax
   - Change color and font with `.json`
   - Use tables, links, pictures and videos `@Macros` to make your documentation juicy
     
3. Export it using GitHub Actions
   - Create a [script file](https://github.com/iamalexman/Memojis/blob/main/build-docc.sh) containing the commands:

      - Build rule to create the `.doccacrchive`
      - Transforming rule to create an archive and convert it to a static site
      - Make a redirect with `window.location.href` and put it in the `.docs` directory
     
4. Publish it as a static site on your GitHub Pages
   - Choose a GitHub Actions source to build and deploy
   - Create a directory for future workflow `.github/workflows` in the root repository
   - Create a [YAML file](https://github.com/iamalexman/Memojis/blob/main/.github/workflows/docc.yml) and configure rules in it for building and deploying workflows
   
>
> [The final documentation](https://iamalexman.github.io/Memojis/documentation/memojis) is based on a project I completed while learning Swift a few years ago in "Stanford's CS193p cource: Developing Applications for iOS"
> 
> The [cource](https://cs193p.sites.stanford.edu/about-cs193p) explains the fundamentals of how to build a memory game for iPhone and iPad using SwiftUI and MVVM architecture pattern.
> 

##

### Memojis Application

🃏🃏 Test your brain to find emoji pairs and flip all the cards!

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
