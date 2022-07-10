import Cocoa

final class StatusBarController {

    private(set) var statusItem: NSStatusItem
    private(set) unowned var popover: NSPopover

    init(_ popover: NSPopover) {
        self.popover = popover

        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)

        statusItem.button?.image = NSImage(systemSymbolName: "snowflake", accessibilityDescription: nil)
        statusItem.button?.action = #selector(openMainView(_:))
        statusItem.button?.target = self
    }

    @objc private func openMainView(_ sender: Any?) {
        if popover.isShown {
            popover.performClose(sender)
        } else {
            guard let button = statusItem.button else { return }
            NSApplication.shared.becomeFirstResponder()

            popover.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
        }
    }
}
