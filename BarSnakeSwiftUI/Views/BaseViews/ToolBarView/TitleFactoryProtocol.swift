import SwiftUI

protocol TitleFactoryProtocol {
    associatedtype T: Pickable

    func getTitle(with _: T) -> Text
}
