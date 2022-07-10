import SwiftUI

struct BaseMenuButton: View {

    let type: MenuButtonType
    let action: VoidClosure

    var body: some View {
        Button(action: action) {
            Text(type.rawValue)
                .font(.headline)
                .foregroundColor(.defaultFontColor)
                .padding(.horizontal, Constants.defaultInset)
                .frame(height: Constants.defaultButtonSize)
                .background(Color.secondary)
                .clipShape(RoundedRectangle(cornerRadius: Constants.defaultCornerRaduis))
        }
        .buttonStyle(.plain)
    }
}
