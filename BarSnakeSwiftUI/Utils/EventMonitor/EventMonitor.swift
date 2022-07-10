import SwiftUI

protocol EventMonitorDelegate {
    var keyBindingType: KeyBindingType { get }

    func keyUp()
    func keyDown()
    func keyLeft()
    func keyRight()
}

struct EventMonitor: Commands {

    let delegate: EventMonitorDelegate

    init(delegate: EventMonitorDelegate) {
        self.delegate = delegate
    }

    private var moveButtons: some View {
        Group {
            // TODO: make localizable
            CommandButton(title: "Move up", shortCut: delegate.keyBindingType.up, action: delegate.keyUp)

            // TODO: make localizable
            CommandButton(title: "Move right", shortCut: delegate.keyBindingType.right, action: delegate.keyRight)

            // TODO: make localizable
            CommandButton(title: "Move down", shortCut: delegate.keyBindingType.down, action: delegate.keyDown)

            // TODO: make localizable
            CommandButton(title: "Move left", shortCut: delegate.keyBindingType.left, action: delegate.keyLeft)
        }
    }

    var body: some Commands {
        // TODO: make localizable
        CommandMenu("Move") {
            moveButtons
        }
    }
}
