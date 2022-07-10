import SwiftUI

struct ImageSelectable: View {

    let isSelected: Bool
    let imageSelected: Image
    let imageDeselected: Image

    var body: some View {
        Group {
            if isSelected {
                imageSelected
                    .resizable()
                    .scaledToFit()
            } else {
                imageDeselected
                    .resizable()
                    .scaledToFit()
            }
        }
        .frame(width: Constants.defaultButtonSize, height: Constants.defaultButtonSize)
    }
}
