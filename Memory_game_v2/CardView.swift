import SwiftUI
struct CardView: View {
    
    var card: MemoGameModel<String>.Card
    var color: Color
    
    var body: some View {

        let base = RoundedRectangle(cornerRadius: 12)
        
        base
            .fill(card.isFaceUp ? .white : color)
            .overlay(
                Group{
                    if card.isFaceUp {
                        CirclePartShape()
                            .fill(color)
                        base.strokeBorder(lineWidth: 3)
                        Text(card.content)
                            .font(.system(size: 200))
                            .minimumScaleFactor(0.01)
                            .aspectRatio(1, contentMode: .fit)
                            .rotationEffect(.degrees(card.isMatched ? 360 : 0))
                            .onAppear{
                                withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)){
                                    
                                }
                            }
                    }
                }
            )
            .aspectRatio(2/3, contentMode: .fill)
            .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
        
        
    }
}
