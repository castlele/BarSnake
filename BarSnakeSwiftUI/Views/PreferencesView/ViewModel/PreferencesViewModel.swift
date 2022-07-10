import SwiftUI

// MARK: - PreferencesViewModel

final class PreferencesViewModel: ObservableObject {

    private enum CodingKeys: String {
        case snakeColor
        case fieldColor
        case gridColor
        case isGridShown
        case fieldSizeType
        case keyBindingType
        case isScoreBoardSave
    }

    static let shared = PreferencesViewModel()

    // MARK: - Private properties

    private var initialKeyBinding: KeyBindingType = .arrows

    // MARK: - Sections

    @Published var currentSectionIndex: Int = .zero

    // MARK: - Visual preferences App storage properties

    @AppStorage(CodingKeys.snakeColor.rawValue)
    private var savedSnakeColor = Data()

    @AppStorage(CodingKeys.fieldColor.rawValue)
    private var savedFieldColor = Data()

    @AppStorage(CodingKeys.gridColor.rawValue)
    private var savedGridColor = Data()

    @AppStorage(CodingKeys.isGridShown.rawValue)
    private var savedIsGridShown = true

    @AppStorage(CodingKeys.fieldSizeType.rawValue)
    private var savedFieldSizeType = Data()

    // MARK: - Key bindings App storage properties

    @AppStorage(CodingKeys.keyBindingType.rawValue)
    private var savedKeyBindingType = Data()

    // MARK: - Other App storage properties

    @AppStorage(CodingKeys.isScoreBoardSave.rawValue)
    private var savedIsScoreBoardSave = true

    // MARK: - Visual preferences published properties

    @Published var snakeColor: CGColor = Constants.defaultSnakeColor.cgColor {
        didSet {
            guard let newColor = NSColor(cgColor: snakeColor) else { return }

            if let colorData = newColor.data {
                savedSnakeColor = colorData
            }
        }
    }
    @Published var fieldColor: CGColor = Constants.defaultFieldColor.cgColor {
        didSet {
            guard let newColor = NSColor(cgColor: fieldColor) else { return }

            if let colorData = newColor.data {
                savedFieldColor = colorData
            }
        }
    }
    @Published var gridColor: CGColor = Constants.defaultGridColor.cgColor {
        didSet {
            guard let newColor = NSColor(cgColor: gridColor) else { return }

            if let colorData = newColor.data {
                savedGridColor = colorData
            }
        }
    }
    @Published var isGridHidden = false {
        didSet {
            savedIsGridShown = isGridHidden
        }
    }
    @Published var fieldSizeType: FieldSizeType = .normal {
        didSet {
            guard let newSizeTypeData = Data.data(fieldSizeType) else { return }
            savedFieldSizeType = newSizeTypeData
        }
    }

    // MARK: - Key bindings preferences published properties

    @Published var keyBindingType: KeyBindingType = .arrows {
        didSet {
            guard let newKeyBindingTypeData = Data.data(keyBindingType) else { return }
            savedKeyBindingType = newKeyBindingTypeData
        }
    }

    // MARK: - Other preferences published properties

    @Published var isScoreBoardSave = false {
        didSet {
            savedIsScoreBoardSave = isScoreBoardSave
        }
    }

    // MARK: - Helper properties

    @Published var isKeyBindingChanged = false

    var fieldSizeTitle: String {
        let size = Int(fieldSize)
        return String(format: .resolution, size, size)
    }

    var fieldSize: CGFloat {
        fieldSizeType.size
    }

    var gridCenter: CGFloat {
        fieldSize / 2
    }

    var toolBarSpacing: CGFloat {
        let sectionsAmount = SectionType.allCases.count
        let spacesAmount = CGFloat(sectionsAmount + 1)
        let sectionsSize = CGFloat(sectionsAmount) * Constants.defaultButtonSize
        let spacing = (fieldSize - sectionsSize) / spacesAmount

        return spacing
    }

    // MARK: - Init

    private init() {
        snakeColor = savedSnakeColor.color?.cgColor ?? Constants.defaultSnakeColor.cgColor
        fieldColor = savedFieldColor.color?.cgColor ?? Constants.defaultFieldColor.cgColor
        gridColor = savedGridColor.color?.cgColor ?? Constants.defaultGridColor.cgColor
        isGridHidden = savedIsGridShown
        fieldSizeType = savedFieldSizeType.getObject() ?? .normal
        keyBindingType = savedKeyBindingType.getObject() ?? .arrows
        initialKeyBinding = keyBindingType
        isScoreBoardSave = savedIsScoreBoardSave
    }

    // MARK: - Public methods

    func isKeyBindingChanged(_ keyBinding: KeyBindingType) {
        isKeyBindingChanged = keyBinding != initialKeyBinding
    }

    func changeKeyBindingTypeBack() {
        keyBindingType = initialKeyBinding
    }
}
