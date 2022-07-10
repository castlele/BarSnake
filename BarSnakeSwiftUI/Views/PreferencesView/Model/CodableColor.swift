import Cocoa

struct CodableColor: Codable {
    var red: CGFloat
    var green: CGFloat
    var blue: CGFloat
    var alpha: CGFloat

    var nsColor: NSColor {
        NSColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}

extension CodableColor {
    init?(nsColor: NSColor) {
        guard let rgbColor = nsColor.usingColorSpace(.deviceRGB) else { return nil }

        red = rgbColor.redComponent
        green = rgbColor.greenComponent
        blue = rgbColor.blueComponent
        alpha = rgbColor.alphaComponent
    }
}
