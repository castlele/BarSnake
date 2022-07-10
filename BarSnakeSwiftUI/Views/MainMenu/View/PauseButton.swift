import SwiftUI

struct PauseButton: View {

    @EnvironmentObject var viewModel: GameViewModel

    private var image: Image {
        viewModel.isGameStarted
        ? Image.pauseIcon()
        : Image.preferencesIcon()
    }

    var body: some View {
        Button(action: viewModel.pauseGame) {
            image
                .resizable()
                .scaledToFit()
                .foregroundColor(.defaultFontColor)
                .frame(width: Constants.defaultButtonSize, height: Constants.defaultButtonSize)
                .background(Color.clear)
        }
        .buttonStyle(.plain)
        .frame(width: Constants.defaultButtonSize, height: Constants.defaultButtonSize)
        .padding([.top, .trailing], Constants.smallInset)
        .disabled(viewModel.isGameOver)
        .isHidden(viewModel.isGamePaused)
    }
}
