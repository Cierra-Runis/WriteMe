//
//  UnicodePropertiesView.swift
//  Write Me
//
//  Created by Runis Cierra on 2024/5/24.
//

import SwiftUI

struct UnicodePropertiesView: View {
    let unicode: UnicodeScalar

    var body: some View {
        Section("Unicode Properties") {
            HStack {
                Text("Dash")
                Spacer()
                Circle().foregroundStyle(unicode.properties.isDash ? .green : .red).frame(width: 10, height: 10)
            }
            HStack {
                Text("Math")
                Spacer()
                Circle().foregroundStyle(unicode.properties.isMath ? .green : .red).frame(width: 10, height: 10)
            }
            HStack {
                Text("Cased")
                Spacer()
                Circle().foregroundStyle(unicode.properties.isCased ? .green : .red).frame(width: 10, height: 10)
            }
            HStack {
                Text("Emoji")
                Spacer()
                Circle().foregroundStyle(unicode.properties.isEmoji ? .green : .red).frame(width: 10, height: 10)
            }
            HStack {
                Text("Radical")
                Spacer()
                Circle().foregroundStyle(unicode.properties.isRadical ? .green : .red).frame(width: 10, height: 10)
            }
            HStack {
                Text("Extender")
                Spacer()
                Circle().foregroundStyle(unicode.properties.isExtender ? .green : .red).frame(width: 10, height: 10)
            }
            HStack {
                Text("Diacritic")
                Spacer()
                Circle().foregroundStyle(unicode.properties.isDiacritic ? .green : .red).frame(width: 10, height: 10)
            }
            HStack {
                Text("Lowercase")
                Spacer()
                Circle().foregroundStyle(unicode.properties.isLowercase ? .green : .red).frame(width: 10, height: 10)
            }
            HStack {
                Text("Uppercase")
                Spacer()
                Circle().foregroundStyle(unicode.properties.isUppercase ? .green : .red).frame(width: 10, height: 10)
            }
            HStack {
                Text("Alphabetic")
                Spacer()
                Circle().foregroundStyle(unicode.properties.isAlphabetic ? .green : .red).frame(width: 10, height: 10)
            }
            HStack {
                Text("Deprecated")
                Spacer()
                Circle().foregroundStyle(unicode.properties.isDeprecated ? .green : .red).frame(width: 10, height: 10)
            }
            HStack {
                Text("Whitespace")
                Spacer()
                Circle().foregroundStyle(unicode.properties.isWhitespace ? .green : .red).frame(width: 10, height: 10)
            }
            HStack {
                Text("Ideographic")
                Spacer()
                Circle().foregroundStyle(unicode.properties.isIdeographic ? .green : .red).frame(width: 10, height: 10)
            }
            HStack {
                Text("ID Start")
                Spacer()
                Circle().foregroundStyle(unicode.properties.isIDStart ? .green : .red).frame(width: 10, height: 10)
            }
            HStack {
                Text("Hex Digit")
                Spacer()
                Circle().foregroundStyle(unicode.properties.isHexDigit ? .green : .red).frame(width: 10, height: 10)
            }
            HStack {
                Text("XID Start")
                Spacer()
                Circle().foregroundStyle(unicode.properties.isXIDStart ? .green : .red).frame(width: 10, height: 10)
            }
            HStack {
                Text("ID Continue")
                Spacer()
                Circle().foregroundStyle(unicode.properties.isIDContinue ? .green : .red).frame(width: 10, height: 10)
            }
            HStack {
                Text("Soft Dotted")
                Spacer()
                Circle().foregroundStyle(unicode.properties.isSoftDotted ? .green : .red).frame(width: 10, height: 10)
            }
            HStack {
                Text("Bidi Control")
                Spacer()
                Circle().foregroundStyle(unicode.properties.isBidiControl ? .green : .red).frame(width: 10, height: 10)
            }
            HStack {
                Text("Join Control")
                Spacer()
                Circle().foregroundStyle(unicode.properties.isJoinControl ? .green : .red).frame(width: 10, height: 10)
            }
            HStack {
                Text("XID Continue")
                Spacer()
                Circle().foregroundStyle(unicode.properties.isXIDContinue ? .green : .red).frame(width: 10, height: 10)
            }
            HStack {
                Text("Bidi Mirrored")
                Spacer()
                Circle().foregroundStyle(unicode.properties.isBidiMirrored ? .green : .red).frame(width: 10, height: 10)
            }
            HStack {
                Text("Grapheme Base")
                Spacer()
                Circle().foregroundStyle(unicode.properties.isGraphemeBase ? .green : .red).frame(width: 10, height: 10)
            }
            HStack {
                Text("Case Ignorable")
                Spacer()
                Circle().foregroundStyle(unicode.properties.isCaseIgnorable ? .green : .red).frame(width: 10, height: 10)
            }
            HStack {
                Text("Emoji Modifier")
                Spacer()
                Circle().foregroundStyle(unicode.properties.isEmojiModifier ? .green : .red).frame(width: 10, height: 10)
            }
            HStack {
                Text("Pattern Syntax")
                Spacer()
                Circle().foregroundStyle(unicode.properties.isPatternSyntax ? .green : .red).frame(width: 10, height: 10)
            }
            HStack {
                Text("Quotation Mark")
                Spacer()
                Circle().foregroundStyle(unicode.properties.isQuotationMark ? .green : .red).frame(width: 10, height: 10)
            }
            HStack {
                Text("Grapheme Extend")
                Spacer()
                Circle().foregroundStyle(unicode.properties.isGraphemeExtend ? .green : .red).frame(width: 10, height: 10)
            }
            HStack {
                Text("Sentence Terminal")
                Spacer()
                Circle().foregroundStyle(unicode.properties.isSentenceTerminal ? .green : .red).frame(width: 10, height: 10)
            }
            HStack {
                Text("Unified Ideograph")
                Spacer()
                Circle().foregroundStyle(unicode.properties.isUnifiedIdeograph ? .green : .red).frame(width: 10, height: 10)
            }
            HStack {
                Text("Emoji Presentation")
                Spacer()
                Circle().foregroundStyle(unicode.properties.isEmojiPresentation ? .green : .red).frame(width: 10, height: 10)
            }
            HStack {
                Text("Pattern Whitespace")
                Spacer()
                Circle().foregroundStyle(unicode.properties.isPatternWhitespace ? .green : .red).frame(width: 10, height: 10)
            }
            HStack {
                Text("Variation Selector")
                Spacer()
                Circle().foregroundStyle(unicode.properties.isVariationSelector ? .green : .red).frame(width: 10, height: 10)
            }
            HStack {
                Text("Terminal Punctuation")
                Spacer()
                Circle().foregroundStyle(unicode.properties.isTerminalPunctuation ? .green : .red).frame(width: 10, height: 10)
            }
            HStack {
                Text("ASCII Hex Digit")
                Spacer()
                Circle().foregroundStyle(unicode.properties.isASCIIHexDigit ? .green : .red).frame(width: 10, height: 10)
            }
            HStack {
                Text("Emoji Modifier Base")
                Spacer()
                Circle().foregroundStyle(unicode.properties.isEmojiModifierBase ? .green : .red).frame(width: 10, height: 10)
            }
            HStack {
                Text("IDS Binary Operator")
                Spacer()
                Circle().foregroundStyle(unicode.properties.isIDSBinaryOperator ? .green : .red).frame(width: 10, height: 10)
            }
            HStack {
                Text("IDS Trinary Operator")
                Spacer()
                Circle().foregroundStyle(unicode.properties.isIDSTrinaryOperator ? .green : .red).frame(width: 10, height: 10)
            }
            HStack {
                Text("Logical Order Exception")
                Spacer()
                Circle().foregroundStyle(unicode.properties.isLogicalOrderException ? .green : .red).frame(width: 10, height: 10)
            }
            HStack {
                Text("Noncharacter Code Point")
                Spacer()
                Circle().foregroundStyle(unicode.properties.isNoncharacterCodePoint ? .green : .red).frame(width: 10, height: 10)
            }
            HStack {
                Text("Full Composition Exclusion")
                Spacer()
                Circle().foregroundStyle(unicode.properties.isFullCompositionExclusion ? .green : .red).frame(width: 10, height: 10)
            }
            HStack {
                Text("Default Ignorable Code Point")
                Spacer()
                Circle().foregroundStyle(unicode.properties.isDefaultIgnorableCodePoint ? .green : .red).frame(width: 10, height: 10)
            }
        }
    }
}

#Preview {
    NavigationStack { List { UnicodePropertiesView(unicode: "你") } }
}
