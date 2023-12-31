import SwiftUI
struct CardView: View {
    
    @State var isRotating = false
    
    var card: MemoGameModel<String>.Card
    
    var body: some View {

        let base = RoundedRectangle(cornerRadius: 12)
        
        base
            .overlay(
                Group {
                    base.fill(.white)
                    base.strokeBorder(lineWidth: 3)
                    CirclePartShape()
                    Text(card.content)
                        .font(.system(size: 200))
                        .minimumScaleFactor(0.01)
                        .aspectRatio(1, contentMode: .fit)
                        .rotationEffect(.degrees(card.isMatched ? 360 : 0))
                        .animation(.linear(duration: 2).repeatForever(autoreverses: false), value: card.isMatched)
                }.opacity(card.isFaceUp ? 1 : 0)
            )
            .aspectRatio(2/3, contentMode: .fill)
            .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
        
        
    }
}
