import SwiftUI

struct GameView: View {

    @EnvironmentObject var viewModel: GameViewModel
    @EnvironmentObject var preferences: PreferencesViewModel

    var body: some View {
        ZStack {
            GameFieldView(fieldColor: preferences.fieldColor, gridColor: preferences.gridColor)

            SnakeView(color: preferences.snakeColor)

            FoodView(viewModel: .init(position: viewModel.foodPosition, color: .red))
        }
        .onAppear(perform: viewModel.restartGame)
        .onReceive(viewModel.timer) { _ in
            guard !viewModel.isGamePaused, !viewModel.isGameOver else { return }

            viewModel.eatFoodIfNeeded()
            viewModel.changeDirection()
            viewModel.setGameOverIfNeeded()
        }
    }
}
