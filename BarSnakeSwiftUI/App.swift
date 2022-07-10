import SwiftUI

@main
struct MenuBarPopoverApp: App {

    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        Settings{
            EmptyView()
        }
        .commands {
            EventMonitor(delegate: appDelegate)
        }
    }
}
