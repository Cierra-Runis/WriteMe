//
//  UnicodeCard.swift
//  Write Me
//
//  Created by Runis Cierra on 2024/5/20.
//

import SwiftUI

struct UnicodeCard: View {
    let unicode: UInt16

    var unNullableScalar: UnicodeScalar {
        return UnicodeScalar(unicode) ?? UnicodeScalar(0xE001)!
    }

    var body: some View {
        NavigationLink {
            EditorPage(unicode: unicode)
        }
        label: {
            GeometryReader {
                _ in ZStack {
                    Text("\(unNullableScalar.description)")
                        .frame(alignment: .top)
                        .font(.custom("Plangothic P1", size: Font.largeTitle.pointSize))
                        .font(.custom("Plangothic P2", size: Font.largeTitle.pointSize))
                        .foregroundStyle(.secondary)

                        .border(.ultraThinMaterial, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)

                    VStack(alignment: .leading) {
                        Text("\(unicode.toHexString(prefix: "U+"))")
                            .font(.title2)
                            .monospaced()
                            .fontWeight(.bold)
                            .foregroundStyle(.secondary)

                        Spacer()
                        HStack(alignment: .bottom) {
                            VStack(alignment: .leading) {
                                Text("\(unNullableScalar.description)")
                                    .font(.custom("Plangothic P1", size: Font.title2.pointSize))
                                    .font(.custom("Plangothic P2", size: Font.title2.pointSize))
                                    .foregroundStyle(.secondary)
                            }
                            Spacer()
                        }
                    }
                }.lineLimit(1)
            }
            .padding(25.0).background(.regularMaterial)
            .containerShape(RoundedRectangle(cornerRadius: 25.0))
            .frame(maxWidth: 400, maxHeight: 400)
            .aspectRatio(1, contentMode: .fit)
        }.foregroundStyle(.primary)
    }
}

#Preview {
    UnicodeCard(unicode: UInt16.random(in: UInt16.min ... UInt16.max))
}
