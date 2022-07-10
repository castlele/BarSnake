import SwiftUI

struct CommandButton: View {

    let title: String
    let shortCut: KeyEquivalent
    let modifiers: EventModifiers = []
    let action: VoidClosure?

    var body: some View {
        Button(title) {
            action?()
        }.keyboardShortcut(shortCut, modifiers: modifiers)
    }
}
