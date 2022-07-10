struct ServiceDependencies {
    var mainMenuViewModel: MainMenuViewModel
    var gameViewModel: GameViewModel
    var preferencesViewModel: PreferencesViewModel

    init() {
        mainMenuViewModel = .init()
        gameViewModel = .init()
        preferencesViewModel = .shared
    }
}
