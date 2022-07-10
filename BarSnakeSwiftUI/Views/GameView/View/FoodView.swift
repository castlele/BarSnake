import SwiftUI

struct FoodView: View {

    var viewModel: FoodModel

    var body: some View {
        Rectangle()
            .fill(viewModel.color)
            .frame(width: Constants.cellSize, height: Constants.cellSize)
            .position(viewModel.position)
    }
}
