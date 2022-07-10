import SwiftUI

protocol IconFactoryProtocol {
    associatedtype T: Pickable
    
    func getIcon(with _: T, isSelected: Bool) -> ImageSelectable?
}
