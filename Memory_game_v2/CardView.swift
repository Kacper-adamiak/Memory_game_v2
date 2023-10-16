//
//  CardView.swift
//  Memory_game_v2
//
//  Created by student on 16/10/2023.
//

import SwiftUI

struct CardView: View {
    var cardContent: String = ""
    @State var isShown: Bool = true
    var body: some View {
        Group{
            ZStack{
                Group{
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.white)
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.blue, lineWidth: 2)
                    Text(cardContent).font(.largeTitle)
                }.opacity(isShown ? 1 : 0)
                Group{
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.blue)
                }.opacity(isShown ? 0 : 1)
            }
        }.onTapGesture {
            isShown.toggle()
        }.aspectRatio(1/1, contentMode: .fill)

            
    }
}
