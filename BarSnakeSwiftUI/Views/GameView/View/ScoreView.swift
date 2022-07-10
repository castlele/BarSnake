import SwiftUI

struct ScoreView: View {

    @EnvironmentObject var viewModel: GameViewModel

    var body: some View {
        Text("\(viewModel.score)")
            .font(Constants.scoreFont)
            .foregroundColor(.defaultFontColor)
            .padding(.horizontal, .horizontalInset)
            .padding(.vertical, .verticalInset)
            .background {
                RoundedRectangle(cornerRadius: Constants.defaultCornerRaduis)
                    .fill(Color.primary)
            }
            .opacity(Constants.weakColorOpacity)
            .padding([.top, .leading], Constants.smallInset)
            .isHidden(!viewModel.isGameStarted)
    }
}

// MARK: - Constants

private extension CGFloat {
    static let horizontalInset: CGFloat = 10
    static let verticalInset: CGFloat = 6
}
