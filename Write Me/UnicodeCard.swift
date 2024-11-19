//
//  UnicodeCard.swift
//  Write Me
//
//  Created by Runis Cierra on 2024/5/20.
//

import SwiftUI

struct UnicodeCard: View {
    let unicode: UnicodeScalar
    let color: Color?

    init(unicode: UnicodeScalar, color: Color? = nil) {
        self.unicode = unicode
        self.color = color
    }

    var body: some View {
        NavigationLink {
            EditorPage(unicode: unicode)
        }
        label: {
            ZStack {
                CharacterMetricsView(unicodeScalar: unicode)

                VStack(alignment: .leading) {
                    Text("U+\(unicode.value, specifier: "%LLX")")
                        .font(.title2)
                        .monospaced()
                        .fontWeight(.bold)
                        .foregroundStyle(color != nil ? color! : .secondary)

                    Spacer()
                    HStack(alignment: .bottom) {
                        VStack(alignment: .leading) {
                            if unicode.properties.name != nil { Text("\(unicode.properties.name!)").foregroundStyle(.secondary) } else {
                                if unicode.properties.nameAlias != nil { Text("\(unicode.properties.nameAlias!)").foregroundStyle(.secondary) }
                            }
                        }
                        Spacer()
                    }
                }
            }.lineLimit(1)
                .padding(25.0).background(.regularMaterial)
                .containerShape(RoundedRectangle(cornerRadius: 25.0))
                .frame(maxWidth: 400, maxHeight: 400)
                .aspectRatio(1, contentMode: .fit)
        }.foregroundStyle(.primary)
    }
}

#Preview {
    UnicodeCard(unicode: UnicodeScalar("\u{0}"))
}
