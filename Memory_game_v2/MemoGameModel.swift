//
//  MemoGameModel.swift
//  Memory_game_v2
//
//  Created by student on 07/11/2023.
//

import Foundation

public struct MemoGameModel<CardContent> {
    private var cards: [Card]
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for pairIndex in 2..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    mutating func choose(card: Card){
        if let choosenIndex = index(of: card) {
            cards[choosenIndex].isFaceUp.toggle()
        }
    }
    
    func index(of card: Card) -> Int?{
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return nil
    }

    struct Card: Identifiable {
        var id = UUID()
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }

}

