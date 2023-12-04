import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: MemoGameViewModel
    @State private var lastScoreChange: (points: Int, cardId: String) = (0, "0")
    
    var body: some View {
        VStack {
            Text("Memo").font(.title)
            cards.animation(.default, value: viewModel.cards)
            HStack {
                Text("Wynik: \(viewModel.score)")
                Button(action: {
                    viewModel.shuffle()}) {
                        Text("Przetasuj")
                            .font(.headline)
                            .padding()
                            .background(viewModel.themeColor)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
            }
            ThemeButtons.foregroundColor(viewModel.themeColor)
        }}
    
    var cards : some View {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing:0)]){
                ForEach(viewModel.cards) { card in
                    ZStack{
                        CardView(card: card, color: viewModel.themeColor)
                            .aspectRatio(2/3, contentMode: .fit)
                            .padding(4)
                            .onTapGesture {
                                
                                let previous = viewModel.score
                                viewModel.choose(card)
                                let score = viewModel.score - previous
                                lastScoreChange = (score, card.id)
                                
                            }
                            .transformIntoCard(isFaceUp: card.isFaceUp)
                            if card.id == lastScoreChange.cardId && lastScoreChange.points != 0 {
                                FlyingNumberView(number: lastScoreChange.points)
                                    .onAppear{
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                                            lastScoreChange = (0, "0")
                                        }
                                    }
                                
                            }
                    }
                            
                        
                }
            }.foregroundColor(viewModel.themeColor)
        }
    
    func scoreChange(fro cardId: String) -> Int {
        return cardId == lastScoreChange.cardId ? lastScoreChange.points : 0
    }
    
    
    var ThemeButtons: some View{
        HStack{
            Spacer()
            ThemeButton(viewModel: viewModel, imageName: "face.smiling.fill", content: "Motyw 1", themeType: 0)
            Spacer()
            ThemeButton(viewModel: viewModel, imageName: "pawprint.circle.fill", content: "Motyw 2", themeType: 1)
            Spacer()
            ThemeButton(viewModel: viewModel, imageName: "tennisball.circle.fill", content: "Motyw 3", themeType: 2)
            Spacer()
        }
    }
}
