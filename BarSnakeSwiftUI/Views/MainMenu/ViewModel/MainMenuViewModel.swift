import Cocoa

final class MainMenuViewModel: ObservableObject {

    @Published var isSettingsView = false
}

// MARK: - MainMenuViewModel + MainMenuViewModelProtocol

extension MainMenuViewModel: MainMenuViewModelProtocol {
    func quitApplication() {
        NSApplication.shared.terminate(self)
    }
}
