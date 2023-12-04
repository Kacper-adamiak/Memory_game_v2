import SwiftUI

class MemoGameViewModel: ObservableObject {
    
    private static let emojis = [
        ["🥹","🥸","🥶","😱","🫠","🤠","😍","🫥","🤧","😇"],
        ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐻‍❄️","🐨"],
        ["⚽️","🏀","🏈","⚾️","🎾","🏉","🥏","🎱","🏓","🏸"]
    ]
    @Published var themeType = 0
    var themeColor: Color {
        get {
            return [Color.purple, Color.blue, Color.yellow][themeType]
        }
    }
    var score: Int {
        model.score
    }

    private static func createMemoGame() -> MemoGameModel<String> {
            return MemoGameModel<String>(numberPairsOfCard: 8) { index in
                if emojis[0].indices.contains(index) {
                    return emojis[0][index]
                } else {
                    return "??"
                }
            }
        }

        @Published private var model = createMemoGame()
    
        var cards: Array<MemoGameModel<String>.Card> {
            return model.cards
        }

        func shuffle() {
            model.shuffle()
        }

        func choose(_ card: MemoGameModel<String>.Card) {
            model.choose(card)
        }

        func changeApplicationTheme(theme: Int) {
            themeType = theme
            model.score = 0
            model.setCards(numberPairsOfCard: 8) { index in
                if MemoGameViewModel.emojis[themeType].indices.contains(index) {
                    return MemoGameViewModel.emojis[themeType][index]
                } else {
                    return "??"
                }
            }
        }
    
 
}
