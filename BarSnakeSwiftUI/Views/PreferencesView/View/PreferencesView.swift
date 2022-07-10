import SwiftUI

struct PreferencesView: View {

    private let buttonsFactory = MenuButtonsFactory()
    private let sectionsFactory = PreferencesSectionsFactory()

    @EnvironmentObject var viewModel: PreferencesViewModel
    @EnvironmentObject var gameViewModel: GameViewModel
    @EnvironmentObject var mainMenuViewModel: MainMenuViewModel

    var body: some View {
        VStack {
            Text(String.preferencesTitle)
                .font(.title)
                .foregroundColor(.defaultFontColor)
                .padding(.top, Constants.defaultInset)

            ToolBarView(spacing: viewModel.toolBarSpacing,
                        sections: SectionType.allCases,
                        iconFactory: self,
                        titleFactory: self,
                        current: $viewModel.currentSectionIndex)

            ScrollView(.vertical) {
                sectionsFactory.getSection(ofType: SectionType.allCases[viewModel.currentSectionIndex],
                                           viewModel: viewModel)
            }

            buttonsFactory.getButtons(ofType: [.backToMenu], viewModel: self)
                .padding(.bottom, Constants.defaultInset)
        }
            // TODO: Localize
        .alert("You changed the control type\nFor changes to take effect restart the application", isPresented: $viewModel.isKeyBindingChanged) {
            Button("Restart later manualy", role: .destructive, action: {})
            Button("Cancel", action: viewModel.changeKeyBindingTypeBack)
            Button("Restart now", role: .cancel, action: mainMenuViewModel.quitApplication)
        }
        .onChange(of: viewModel.keyBindingType) { newValue in
            viewModel.isKeyBindingChanged(newValue)
        }
    }
}

// MARK: - PreferencesView + TitleFactoryProtocol

extension PreferencesView: TitleFactoryProtocol {
    func getTitle(with section: SectionType) -> Text {
        Text(section.rawValue)
    }
}

// MARK: - PreferencesView + IconFactoryProtocol

extension PreferencesView: IconFactoryProtocol {
    func getIcon(with section: SectionType, isSelected: Bool) -> ImageSelectable? {
        guard let imageSelected = section.imageSelected else {
            return nil
        }

        guard let imageDeselected = section.imageDeselected else {
            return nil
        }

        return ImageSelectable(isSelected: isSelected,
                               imageSelected: imageSelected,
                               imageDeselected: imageDeselected)
    }
}

// MARK: - PreferencesView + MenuButtonsDataSource

extension PreferencesView: MenuButtonsDataSource {
    var gameModel: GameViewModelProtocol? {
        gameViewModel
    }

    var mainMenuModel: MainMenuViewModelProtocol? {
        nil
    }
}
