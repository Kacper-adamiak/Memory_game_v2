//
//  MemoGameViewModel.swift
//  Memory_game_v2
//
//  Created by student on 07/11/2023.
//

import Foundation

class MemoGameViewModel: ObservableObject {
    @Published var model: MemoGameModel<String>
    
    init(numberOfCards: Int) {
        model = MemoGameModel<String>(numberOfPairsOfCards: 4){
            pairIndex in
            let symbols = ["A","B","C","D","E","F"]
            if pairIndex < symbols.count {
                return symbols[pairIndex]
            } else {
                return "??"
            }
        }
    }
}
