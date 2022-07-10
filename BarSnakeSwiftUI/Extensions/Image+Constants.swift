import SwiftUI

extension Image {
    static func preferencesIcon() -> Self {
        Image(systemName: Constants.preferencesIconName)
    }

    static func pauseIcon() -> Self {
        Image(systemName: Constants.pauseIconName)
    }

    static func visualPreferencesIcon() -> Self {
        Image(systemName: Constants.visualPreferencesIconName)
    }

    static func keyBindingPreferencesIcon() -> Self {
        Image(systemName: Constants.keyBindingPreferencesIconName)
    }

    static func otherSectionPreferencesIcon() -> Self {
        Image(systemName: Constants.otherSectionIconName)
    }
}
