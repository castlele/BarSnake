import SwiftUI

struct Constants {

    // MARK: - Font

    static let scoreFont: Font = .system(size: 17, weight: .semibold, design: .rounded)

    // MARK: - Size

    static let smallInset: CGFloat = 5
    static let defaultInset: CGFloat = 16

    static var cellSize: CGFloat = 25

    static var corrective: CGFloat { cellSize / 2 }

    static let defaultButtonSize: CGFloat = 28
    
    static let mainViewSizeSmall: CGFloat = 250
    static let mainViewSizeNormal: CGFloat = 350
    static let mainViewSizeLarge: CGFloat = 500

    static let rate: CGFloat = 0.1
    static let rateDescrease: CGFloat = 0.005

    static let defaultCornerRaduis: CGFloat = 10

    // MARK: - Color

    static let strongColorOpacity: CGFloat = 0.2
    static let weakColorOpacity: CGFloat = 0.7

    static let defaultSnakeColor: NSColor = .black

    static let defaultFieldColor: NSColor = .white

    static let defaultGridColor: NSColor = .black

    // MARK: - Image

    static let preferencesIconName = "gearshape.fill"
    static let pauseIconName = "pause.fill"
    static let visualPreferencesIconName = "display"
    static let keyBindingPreferencesIconName = "keyboard"
    static let otherSectionIconName = "ellipsis.circle"
    static let primaryColor = "primary"
    static let secondaryColor = "secondary"
    static let fontColor = "font_color_primary"
}
