import SwiftUI
import Foundation

enum MenuButtonType {
    case quit
    case start
    case restart
    case resume
    case backToMenu

    var rawValue: String {
        switch self {
        case .quit:
            return .menuQuitGame
        case .start:
            return .menuStartGame
        case .restart:
            return .gameRestart
        case .resume:
            return .gameResume
        case .backToMenu:
            return .gameBackToMenu
        }
    }
}

protocol MenuButtonsDataSource {
    var gameModel: GameViewModelProtocol? { get }
    var mainMenuModel: MainMenuViewModelProtocol? { get }
}

struct MenuButtonsFactory {
    func getButtons(ofType type: [MenuButtonType], viewModel: MenuButtonsDataSource) -> some View {
        ForEach(type, id: \.self) { buttonType in
            BaseMenuButton(type: buttonType, action: getActionforButton(ofType: buttonType, viewModel: viewModel))
        }
    }

    private func getActionforButton(ofType type: MenuButtonType, viewModel: MenuButtonsDataSource) -> VoidClosure {
        let gameViewModel = viewModel.gameModel
        let mainMenuViewModel = viewModel.mainMenuModel
        var action: VoidClosure? = nil

        switch type {
        case .quit:
            action = mainMenuViewModel?.quitApplication
        case .start:
            action = gameViewModel?.startGame
        case .restart:
            action = gameViewModel?.restartGame
        case .resume:
            action = gameViewModel?.resumeGame
        case .backToMenu:
            action = gameViewModel?.backToMenu
        }

        return action ?? {}
    }
}
