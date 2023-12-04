//
//  FlyingNumberView.swift
//  Memory_game_v2
//
//  Created by student on 04/12/2023.
//

import SwiftUI

struct FlyingNumberView: View {
   
    let number: Int
    
    @State private var offset: CGFloat = 0
    
    var body: some View {
        Text("\(number, specifier: "%+d")")
            .foregroundColor(number < 0 ? .red : .blue)
            .shadow(color: .black, radius: 1)
            .offset(y: offset)
            .opacity(offset == 0 ? 1 : 0)
            .onAppear{
                withAnimation(.linear(duration: 1.5)){
                    offset = -100
                }
            }
            .onDisappear{
                offset = 0
            }
    }
}
