import SwiftUI

enum FieldSizeType: Pickable, Codable {

    case small
    case normal
    case large

    var rawValue: String {
        switch self {
        case .small:
            return .preferencesFieldSizeSmall
        case .normal:
            return .preferencesFieldSizeNormal
        case .large:
            return .preferencesFieldSizeLarge
        }
    }

    var imageSelected: Image? {
        nil
    }

    var imageDeselected: Image? {
        nil
    }

    var size: CGFloat {
        switch self {
        case .small:
            return Constants.mainViewSizeSmall
        case .normal:
            return Constants.mainViewSizeNormal
        case .large:
            return Constants.mainViewSizeLarge
        }
    }
}
