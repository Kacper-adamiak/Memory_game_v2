//
//  ContentView.swift
//  Memory_game_v2
//
//  Created by student on 16/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var emojis = [
        ["🥹", "🥸", "🥶", "😱", "🫠","🤠", "😍", "🫡", "🤧", "😇", "🤩", "🥳", "😡"],
        ["🐶", "🐱", "🐭", "🐹", "🐰","🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮"],
        ["⚽️", "🏀", "🏈", "⚾️", "🥎","🏐", "🏉", "🥏", "🎱", "🪀", "🏓", "🏸", "🏒"]
    ]
    @State var emojiSelected: Int = 0
        
    @State var themeColor: Color = .blue
    
    @State var cardCounter: Int = 4
    var body: some View {
        VStack {
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], content: {
                    ForEach(1 ... cardCounter, id: \.self){ item in
                        CardView(card: MemoGameModel<String>.Card(content:emojis[emojiSelected][item] ))
                    }
                }).foregroundColor(themeColor)
            }
            
//            navigation
            themeBar
            
        }
        .padding()
    }
    
//    var navigation: some View{
//        HStack{
//            adjustCardNumber(by: -2, symbol: "minus.square")
//                .disabled(cardCounter <= 2 ? true : false)
//
//            Spacer()
//
//            adjustCardNumber(by: 2, symbol: "plus.app")
//                .disabled(cardCounter + 2 >= emojis.count ? true : false)
//        }
//    }
    
    
    var themeBar: some View{
        HStack{
            ThemeButton(text: "Motyw 1", icon: "face.smiling", themeColor: $themeColor, themeInput: .blue, cardCountInput: 4, emojis: $emojis[emojiSelected], cardCount: $cardCounter, emojiSelected: $emojiSelected, emojiInput: 0)
            
            Spacer()
            
            ThemeButton(text: "Motyw 2", icon: "shuffle.circle", themeColor: $themeColor, themeInput: .red, cardCountInput: 8, emojis: $emojis[emojiSelected], cardCount: $cardCounter, emojiSelected: $emojiSelected, emojiInput: 1)
            
            Spacer()
            
            ThemeButton(text: "Motyw 3", icon: "pawprint.circle", themeColor: $themeColor, themeInput: .green, cardCountInput: 12, emojis: $emojis[emojiSelected], cardCount: $cardCounter, emojiSelected: $emojiSelected, emojiInput: 2)
        }
        
    }
    
    
    
//    func adjustCardNumber(by offset: Int, symbol: String) -> some View {
//        return Button(action: {cardCounter = cardCounter + offset}, label: {
//            Image(systemName: symbol).resizable()
//                .frame(width: 30, height: 30)
//        })
//    }
}

