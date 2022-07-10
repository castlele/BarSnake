import Cocoa
import SwiftUI

// MARK: - AppDelegate
final class AppDelegate: NSObject, NSApplicationDelegate {

    private let popover = NSPopover()
    private let serviceDependencies = ServiceDependencies()
    private var statusBarController: StatusBarController!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        NSApplication.shared.activate(ignoringOtherApps: true)
        let mainView = MainMenu()
            .environmentObject(serviceDependencies.mainMenuViewModel)
            .environmentObject(serviceDependencies.gameViewModel)
            .environmentObject(serviceDependencies.preferencesViewModel)

        popover.contentViewController = NSViewController()
        popover.contentViewController?.view = NSHostingView(rootView: mainView)
        popover.behavior = .applicationDefined
        popover.animates = true

        statusBarController = .init(popover)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }
}

// MARK: - Extension + EventMonitorDelegate

extension AppDelegate: EventMonitorDelegate {
    var keyBindingType: KeyBindingType {
        serviceDependencies.preferencesViewModel.keyBindingType
    }

    func keyUp() {
        guard serviceDependencies.gameViewModel.isGameStarted,
              !serviceDependencies.gameViewModel.isGamePaused else {
                  return
              }

        if serviceDependencies.gameViewModel.moveDirection != .down {
            serviceDependencies.gameViewModel.moveDirection = .up
        }
    }

    func keyDown() {
        guard serviceDependencies.gameViewModel.isGameStarted,
              !serviceDependencies.gameViewModel.isGamePaused else {
                  return
              }

        if serviceDependencies.gameViewModel.moveDirection != .up {
            serviceDependencies.gameViewModel.moveDirection = .down
        }
    }

    func keyLeft() {
        guard serviceDependencies.gameViewModel.isGameStarted,
              !serviceDependencies.gameViewModel.isGamePaused else {
                  return
              }

        if serviceDependencies.gameViewModel.moveDirection != .right {
            serviceDependencies.gameViewModel.moveDirection = .left
        }
    }

    func keyRight() {
        guard serviceDependencies.gameViewModel.isGameStarted,
              !serviceDependencies.gameViewModel.isGamePaused else {
                  return
              }

        if serviceDependencies.gameViewModel.moveDirection != .left {
            serviceDependencies.gameViewModel.moveDirection = .right
        }
    }
}
