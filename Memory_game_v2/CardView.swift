import SwiftUI
struct CardView: View {
    
    @State var isRotating = false
    
    var card: MemoGameModel<String>.Card
    
    var body: some View {

        let base = RoundedRectangle(cornerRadius: 12)
        
        base
            .overlay(
                Group{
                    if card.isFaceUp {
                        CirclePartShape()
                        base.fill(.white)
                        base.strokeBorder(lineWidth: 3)
                        Text(card.content)
                            .font(.system(size: 200))
                            .minimumScaleFactor(0.01)
                            .aspectRatio(1, contentMode: .fit)
                            .rotationEffect(.degrees(isRotating ? 360 : 0))
                            .onAppear{
                                withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)){
                                    if card.isMatched {
                                        isRotating.toggle()
                                    }
                                }
                            }
                    }
                }
            )
            .aspectRatio(2/3, contentMode: .fill)
            .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
        
        
    }
}
