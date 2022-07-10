import SwiftUI

struct GameFieldView: View {

    private var fieldColor: Color
    private var gridColor: Color

    private var cells: Int {
        Int(preferences.fieldSize / Constants.cellSize)
    }

    @EnvironmentObject var preferences: PreferencesViewModel

    var body: some View {
        VStack(spacing: 0) {
            ForEach(0 ..< cells) { row in
                HStack(spacing: 0) {
                    ForEach(0 ..< cells) { col in
                        Rectangle()
                            .stroke(preferences.isGridHidden ? fieldColor : gridColor)
                            .frame(width: Constants.cellSize, height: Constants.cellSize)
                    }
                }
            }
        }
        .background(fieldColor)
    }
}

extension GameFieldView {
    init(fieldColor: CGColor, gridColor: CGColor) {
        self.fieldColor = Color(cgColor: fieldColor)
        self.gridColor = Color(cgColor: gridColor)
    }
}
