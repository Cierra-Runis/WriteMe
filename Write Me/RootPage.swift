//
//  ContentView.swift
//  Write Me
//
//  Created by Runis Cierra on 2024/5/20.
//

import SwiftData
import SwiftUI

struct RootPage: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var works: [Work]

    var body: some View {
        NavigationSplitView {
            List {
                Section(header: Text("My Works")) {
                    NavigationLink {
                        WorksPage()
                    } label: {
                        Label("My Projects", systemImage: "cloud.bolt.fill")
                    }
                }
                NavigationLink("My Projects", value: "")
                NavigationLink("My Projects", value: "")
            }
            .navigationTitle("Write Me")
        } detail: {
            Text("Select an item")
        }.navigationTitle("Write Me")
    }
}

#Preview {
    RootPage()
        .modelContainer(for: Work.self, inMemory: true)
}
