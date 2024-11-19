import CoreText
import SwiftUI

struct CharacterMetricsView: View {
    let unicodeScalar: UnicodeScalar
    var lineOpacity: Double = 0.5
    var fontSize: CGFloat = 32

    var body: some View {
        Canvas { context, size in

            let font = CTFontCreateWithName("Plangothic P1" as CFString, fontSize, nil)
            let attributes: [NSAttributedString.Key: Any] = [
                .font: font,
                .foregroundColor: UIColor.label
            ]
            let attributedString = NSAttributedString(string: unicodeScalar.description, attributes: attributes)

            let line = CTLineCreateWithAttributedString(attributedString)
            let runArray = CTLineGetGlyphRuns(line) as! [CTRun]

            guard let run = runArray.first else { return }

            let glyphRange = CFRange(location: 0, length: 1)
            var ascent: CGFloat = 0
            var descent: CGFloat = 0
            var leading: CGFloat = 0
            let width = CTRunGetTypographicBounds(run, glyphRange, &ascent, &descent, &leading)

            let bounds = CGRect(x: 0, y: -descent, width: CGFloat(width), height: ascent + descent)
            let origin = CGPoint(x: size.width / 2 - bounds.width / 2, y: size.height / 2 + descent)

            // Translate the context to the origin point
            context.translateBy(x: origin.x, y: origin.y)

            // Draw the character
            context.withCGContext { ctx in
                ctx.textMatrix = .identity
                ctx.scaleBy(x: 1.0, y: -1.0)
                CTLineDraw(line, ctx)
            }

            context.opacity = lineOpacity

            // Draw ascent line
            context.stroke(
                Path(CGRect(x: bounds.minX, y: -ascent, width: bounds.width, height: 0)),
                with: .color(.red),
                lineWidth: 1
            )

            let capHeight = CTFontGetCapHeight(font)
            context.stroke(
                Path(CGRect(x: bounds.minX, y: -capHeight, width: bounds.width, height: 0)),
                with: .color(.orange)
            )

            let xHeight = CTFontGetXHeight(font)
            context.stroke(
                Path(CGRect(x: bounds.minX, y: -xHeight, width: bounds.width, height: 0)),
                with: .color(.yellow)
            )

            // Draw baseline
            context.stroke(
                Path(CGRect(x: 0, y: 0, width: bounds.width, height: 0)),
                with: .color(.green),
                lineWidth: 1
            )

            // Draw descent line
            context.stroke(
                Path(CGRect(x: bounds.minX, y: descent, width: bounds.width, height: 0)),
                with: .color(.blue),
                lineWidth: 1
            )

//            print("\(unicodeScalar) \(unicodeScalar.value) capHeight \(capHeight) ascent \(ascent) xHeight \(xHeight) \(CTFontCopyFamilyName(font)) \(CTFontGetGlyphCount(font))")
        }
    }
}

#Preview {
    NavigationStack {
        CharacterMetricsView(unicodeScalar: "\u{0A11}")
    }
}
