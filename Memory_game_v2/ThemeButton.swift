import SwiftUI

struct ThemeButton: View {
        var viewModel: MemoGameViewModel
        var imageName: String
        var content: String
        var themeType = 0

        var body: some View {
            Button(action: {
                viewModel.changeApplicationTheme(theme: themeType)
                viewModel.shuffle()
            }, label: {
                VStack {
                    Image(systemName: imageName).font(.title)
                    Text(content)
                }
            })
        }
}
