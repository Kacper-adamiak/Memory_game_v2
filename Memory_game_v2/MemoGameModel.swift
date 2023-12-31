import Foundation

struct MemoGameModel<CardContent> where CardContent: Equatable{

    private (set) var cards : Array<Card>
    
    var score = 0

    init(numberPairsOfCard: Int, cardContentFactory:(Int)->CardContent) {
        cards = []
        
        for pairIndex in 0..<max(2, numberPairsOfCard) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card (content: content, id: "\(pairIndex+1)a"))
            cards.append(Card (content: content, id: "\(pairIndex+1)b"))
        }
        
        cards.shuffle()
    }
    
    mutating func setCards(numberPairsOfCard: Int, cardContentFactory:(Int)->CardContent) {
        cards = []
        
        for pairIndex in 0..<max(2, numberPairsOfCard) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card (content: content, id: "\(pairIndex+1)a"))
            cards.append(Card (content: content, id: "\(pairIndex+1)b"))
        }
    }

    var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter{index in cards[index].isFaceUp}.only
        }
        set {
            cards.indices.forEach{cards[$0].isFaceUp = (newValue == $0)}
        }
    }

    mutating func choose (_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}) {
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let potentialMatchedIndex = indexOfOneAndOnlyFaceUpCard {
                    if cards[chosenIndex].content==cards [potentialMatchedIndex].content {
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchedIndex].isMatched = true
                        score += 4
                    } else {
                        if cards[chosenIndex].hasBeenSeen{
                            score -= 1
                        }
                        if cards[potentialMatchedIndex].hasBeenSeen {
                            score -= 1
                        }
                    }
                } else {
                    indexOfOneAndOnlyFaceUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
            }
        }
    }

    private func index(of card: Card) -> Int? {
        for index in cards.indices {
            if cards[index].id == card.id {
                return index
            }
        }
        return nil
    }

    mutating func shuffle() {
        cards.shuffle()
    }

    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        var isFaceUp = false {
            didSet {
                if oldValue && !isFaceUp {
                    hasBeenSeen = true
                }
            }
        }
        var hasBeenSeen = false
        var isMatched = false
        var content: CardContent
        var id: String
        var debugDescription: String {
            return "\(id): \(content) \(isFaceUp ? "up" : "down") \(isMatched ? "mached" : "")"
        }
    }



}

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}

