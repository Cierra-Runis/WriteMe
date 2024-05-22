//
//  SettingsView.swift
//  Write Me
//
//  Created by Runis Cierra on 2024/5/20.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ScrollView {
            Section("通用") {}
            Section("关于") {
                Text("\u{E001}")
                    .font(.custom("Plangothic P1", size: Font.title.pointSize))
                    .font(.custom("Plangothic P2", size: Font.title.pointSize))
            }

        }.navigationTitle(
            "Settings"
        ).navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        SettingsView()
    }
}
