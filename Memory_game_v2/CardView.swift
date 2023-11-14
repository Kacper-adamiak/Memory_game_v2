//
//  CardView.swift
//  Memory_game_v2
//
//  Created by student on 16/10/2023.
//

//import SwiftUI

//struct CardView: View {
//    
//    @State var isFlipped: Bool = false
//    let emoji: String
//    var body: some View {
//        Group{
//            ZStack{
//                if(isFlipped){
//                    RoundedRectangle(cornerRadius: 12).fill(.white)
//                    RoundedRectangle(cornerRadius: 12).strokeBorder(.blue, lineWidth: 5)
//                }else {
//                    RoundedRectangle(cornerRadius: 12)
//                        
//                }
//                
//                Text(emoji).font(.largeTitle).opacity(isFlipped ? 1 : 0)
//            }
//        }
//        .onTapGesture {
//            isFlipped.toggle()
//        }.aspectRatio(2/3, contentMode: .fill)
//        
//        
//    }
//}

import SwiftUI
struct CardView: View {
    
    var card: MemoGameModel<String>.Card
    
    var body: some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            Group{
                base.strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(contentMode: .fit)
            }.opacity(card.isFaceUp ? 1 : 0)
            base.fill().opacity(card.isFaceUp ? 0 : 1)
        }.aspectRatio(2/3,contentMode: .fill)
            .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
        
    }
}
