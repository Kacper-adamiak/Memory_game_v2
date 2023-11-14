//
//  ContentView.swift
//  Memory_game_v2
//
//  Created by student on 16/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: MemoGameViewModel
    
    var body: some View {
        VStack {
            Text("Memo").font(.title)
            cards.animation(.default, value: viewModel.cards)
            Button(action: {
                viewModel.shuffle()}) {
                    Text("Przetasuj")
                        .font(.headline)
                        .padding()
                        .background(viewModel.themeColor)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            ThemeButtons.foregroundColor(viewModel.themeColor)
        }}
    
    var cards : some View {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing:0)]){
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .padding(4)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }.foregroundColor(viewModel.themeColor)
        }
    
    
    var ThemeButtons: some View{
        HStack{
            Spacer()
            ThemeButton(viewModel: viewModel, imageName: "face.smiling", content: "Motyw 1", themeType: 0)
            Spacer()
            ThemeButton(viewModel: viewModel, imageName: "pawprint.circle.fill", content: "Motyw 2", themeType: 1)
            Spacer()
            ThemeButton(viewModel: viewModel, imageName: "tennisball.circle.fill", content: "Motyw 3", themeType: 2)
            Spacer()
        }
    }
}
