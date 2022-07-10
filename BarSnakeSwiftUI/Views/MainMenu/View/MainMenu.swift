import SwiftUI

struct MainMenu: View {

    private let buttonsFactory = MenuButtonsFactory()

    @EnvironmentObject var mainMenuViewModel: MainMenuViewModel
    @EnvironmentObject var gameViewModel: GameViewModel
    @EnvironmentObject var preferencesViewModel: PreferencesViewModel

    private var mainMenuView: some View {
        VStack {
            buttonsFactory.getButtons(ofType: [.start, .quit], viewModel: self)
        }
        .isHidden(gameViewModel.isGamePaused)
    }

    private var gameOverScreen: some View {
        ZStack {
            Color.gameOverBackground

            VStack {
                Text("\(String.gameFinalScore) \(gameViewModel.score)")
                    .font(.title)
                    .bold()
                    .padding(.bottom)

                buttonsFactory.getButtons(ofType: [.restart, .backToMenu], viewModel: self)
            }
        }
    }

    private var preferencesView: some View {
        VStack(alignment: .center) {
            if gameViewModel.isGameStarted {
                pauseView
            } else {
                PreferencesView()
            }
        }
    }

    private var pauseView: some View {
        buttonsFactory.getButtons(ofType: [.restart, .resume, .backToMenu, .quit], viewModel: self)
    }

    var body: some View {
        ZStack {
            if gameViewModel.isGameStarted {
                GameView()
            } else {
                mainMenuView
            }

            if gameViewModel.isGamePaused {
                preferencesView
            }

            if gameViewModel.isGameOver {
                gameOverScreen
            }
        }
        .frame(width: preferencesViewModel.fieldSize,
               height: preferencesViewModel.fieldSize)
        .background(Color.primary)
        .overlay(PauseButton(), alignment: .topTrailing)
        .overlay(ScoreView(), alignment: .topLeading)
    }
}
// MARK: - MainMenu + MenuButtonsDataSource

extension MainMenu: MenuButtonsDataSource {
    var gameModel: GameViewModelProtocol? {
        gameViewModel
    }

    var mainMenuModel: MainMenuViewModelProtocol? {
        mainMenuViewModel
    }
}

// MARK: - Preview

#if DEBUG
struct MainMenu_Preview: PreviewProvider {
    static var previews: some View {
        MainMenu()
            .environmentObject(MainMenuViewModel())
            .environmentObject(GameViewModel())
    }
}
#endif
