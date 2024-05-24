//
//  SettingsView.swift
//  Write Me
//
//  Created by Runis Cierra on 2024/5/20.
//

import SwiftUI

struct SettingsPage: View {
    @Environment(\.openURL) var openURL

    var body: some View {
        List {
            Section("General Settings") {
                LabeledContent {} label: {
                    Label(
                        title: { Text("Dark Mode") },
                        icon: { Image(systemName: "moon") }
                    )
                }
            }
            Section("About Us") {
                LabeledContent {
                    Text("[v1.0.1+1](https://github.com/Cierra-Runis/WriteMe/releases)")
                } label: {
                    Label(
                        title: { Text("Write Me") },
                        icon: { Image("WriteMeIcon").resizable().scaledToFit().clipShape(RoundedRectangle(cornerRadius: 6.0))
                        }
                    )
                }

                LabeledContent {
                    Text("[byrdsaron@gmail.com](mailto://byrdsaron@gmail.com)")
                } label: {
                    Label(
                        title: { Text("Contact") },
                        icon: { Image(systemName: "envelope") }
                    )
                }

                LabeledContent {
                    Text("[Plangothic Project](https://github.com/Fitzgerald-Porthmouth-Koenigsegg/Plangothic-Project)")
                } label: {
                    Label(
                        title: { Text("\u{E001}").font(.custom("Plangothic P1", size: Font.headline.pointSize)) },
                        icon: { Image(systemName: "heart.fill").foregroundStyle(.red) }
                    )
                }
            }

        }.navigationTitle(
            "Settings"
        ).navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        SettingsPage()
    }
}
