import SwiftUI

struct SnakeView: View {

    private var snakeColor: Color

    @EnvironmentObject var viewModel: GameViewModel

    var body: some View {
        ForEach(0 ..< viewModel.bodyParts.count, id: \.self) { index in
            Rectangle()
                .fill(snakeColor)
                .frame(width: Constants.cellSize, height: Constants.cellSize, alignment: .topLeading)
                .position(viewModel.bodyParts[index])
        }
    }
}

extension SnakeView {
    init(color: CGColor) {
        snakeColor = Color(cgColor: color)
    }
}
