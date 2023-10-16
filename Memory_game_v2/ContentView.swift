//
//  ContentView.swift
//  Memory_game_v2
//
//  Created by student on 16/10/2023.
//

import SwiftUI

struct ContentView: View {
    let cardContents = ["😀","🦁","😇","😝","😀","🦁","😇","😝"]
    @State var cardCount: Int = 2
    var body: some View {
        
        cardDisplay
        bottomButtons
        
    }
    
    var cardDisplay: some View {
        ScrollView{
            LazyVGrid(columns:  [GridItem(.adaptive(minimum: 120))]){
                ForEach(0..<cardCount, id: \.self){
                    index in
                    CardView(cardContent: cardContents[index])
                }
            }.padding()
                .foregroundColor(.blue)
        }
    }
    
    var bottomButtons: some View {
        HStack{
            Spacer()
            adjustCardNumber(by: -2, symbol: "-")
            Spacer()
            adjustCardNumber(by: 2, symbol: "+")
            Spacer()
        }
    }
    
    func adjustCardNumber(by offset: Int, symbol: String) -> some View {
        var state: Bool = false
        if(cardCount + offset < 2 || cardCount + offset > cardContents.count){
            state.toggle()
        }
        return Button(symbol) {
            cardCount = cardCount + offset
        }.disabled(state)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
