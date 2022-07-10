import SwiftUI

protocol ImageRepresentable {
    var imageSelected: Image? { get }
    var imageDeselected: Image? { get }
}

protocol Pickable: CaseIterable, Hashable, ImageRepresentable where AllCases == Array<Self> {
    var rawValue: String { get }
}
