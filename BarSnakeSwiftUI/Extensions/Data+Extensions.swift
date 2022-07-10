import Cocoa
import Foundation

extension Data {
    static func data<Object: Codable>(_ object: Object) -> Data? {
        try? JSONEncoder().encode(object)
    }
}

extension Data {
    var color: NSColor? {
        if let color = try? JSONDecoder().decode(CodableColor.self, from: self) {
            return color.nsColor
        }

        return nil
    }
}

extension Data {
    func getObject<Object: Decodable>() -> Object? {
        try? JSONDecoder().decode(Object.self, from: self)
    }
}
