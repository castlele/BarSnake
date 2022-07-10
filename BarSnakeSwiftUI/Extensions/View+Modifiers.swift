import SwiftUI

extension View {
    func isHidden(_ value: Bool) -> some View {
        Group {
            if value {
                self.hidden()
            } else {
                self
            }
        }
    }
}
