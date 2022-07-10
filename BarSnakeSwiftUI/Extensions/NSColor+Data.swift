import Cocoa

extension NSColor {
    var data: Data? {
        let codableColor = CodableColor(nsColor: self)

        return try? JSONEncoder().encode(codableColor)
    }
}
