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
            List {}
        }.navigationTitle(
            "Settings"
        ).navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    SettingsView()
}
