import SwiftUI

enum SectionType: Pickable {
    case visual
    case keyBinding
    case other

    var rows: [RowType] {
        switch self {
        case .visual:
            return [
                .snakeColor,
                .fieldColor,
                .gridColor,
                .isGridHidden,
                .fieldSize
            ]
        case .keyBinding:
            return [
                .keyBindingType
            ]
        case .other:
            return [
                .isScoreBoardSave
            ]
        }
    }

    var rawValue: String {
        switch self {
        case .visual:
            return .preferencesSectionVisual
        case .keyBinding:
            return .preferencesSectionKeyBinding
            // TODO: Localize
        case .other:
            return "Other"
        }
    }

    var imageSelected: Image? {
        switch self {
        case .visual:
            return .visualPreferencesIcon()
        case .keyBinding:
            return .keyBindingPreferencesIcon()
        case .other:
            return .otherSectionPreferencesIcon()
        }
    }

    var imageDeselected: Image? {
        switch self {
        case .visual:
            return .visualPreferencesIcon()
        case .keyBinding:
            return .keyBindingPreferencesIcon()
        case .other:
            return .otherSectionPreferencesIcon()
        }
    }
}

enum RowType {
    case snakeColor
    case fieldColor
    case gridColor
    case isGridHidden
    case fieldSize
    case keyBindingType
    case isScoreBoardSave

    var rawValue: String {
        switch self {
        case .snakeColor:
            return .preferencesSnakeColor
        case .fieldColor:
            return .preferencesFieldColor
        case .gridColor:
            return .preferencesGridColor
        case .isGridHidden:
            return .preferencesIsGridHidden
        case .fieldSize:
            return .preferencesFieldSizeType
        case .keyBindingType:
            return .preferencesSectionKeyBinding
            // TODO: Localization
        case .isScoreBoardSave:
            return "Is score board save"
        }
    }
}

struct PreferencesSectionsFactory {
    func getSection(ofType type: SectionType, viewModel: PreferencesViewModel) -> some View {
        getRows(ofTypes: type.rows, viewModel: viewModel)
    }

    private func getRows(ofTypes types: [RowType], viewModel: PreferencesViewModel) -> some View {
        ForEach(types, id: \.self) { type in
            PreferencesRowView(type: type)
                .environmentObject(viewModel)
        }
    }
}
