import SwiftUI

enum KeyBindingType: Pickable, Codable {
    case arrows
    case wasd

    var up: KeyEquivalent {
        switch self {
        case .arrows:
            return .upArrow
        case .wasd:
            return KeyEquivalent("w")
        }
    }

    var down: KeyEquivalent {
        switch self {
        case .arrows:
            return .downArrow
        case .wasd:
            return KeyEquivalent("s")
        }
    }

    var left: KeyEquivalent {
        switch self {
        case .arrows:
            return .leftArrow
        case .wasd:
            return KeyEquivalent("a")
        }
    }

    var right: KeyEquivalent {
        switch self {
        case .arrows:
            return .rightArrow
        case .wasd:
            return KeyEquivalent("d")
        }
    }

    var rawValue: String {
        switch self {
        case .arrows:
            return .preferencesKeyBindingTypeArrow
        case .wasd:
            return .preferencesKeyBindingTypeWASD
        }
    }

    var imageSelected: Image? {
        nil
    }

    var imageDeselected: Image? {
        nil
    }
}
