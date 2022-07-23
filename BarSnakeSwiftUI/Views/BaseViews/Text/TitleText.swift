import SwiftUI

struct TitleText: View {

    let text: String

    var body: some View {
            Text(text)
                .font(.title)
                .foregroundColor(.defaultFontColor)
                .padding(.top, Constants.defaultInset)
    }

    init(_ text: String) {
        self.text = text
    }
}
