//
//  ContentView.swift
//  Write Me
//
//  Created by Runis Cierra on 2024/5/20.
//

import SwiftUI

struct RootPage: View {
    @State private var isShowingSheet = false

    
    
    
    var body: some View {
        NavigationSplitView {
            List {
                Section(header: Text("My Works")) {
                    NavigationLink {
                        ProjectsPage()
                    } label: {
                        HStack { Text("My Projects") }
                    }
                }
            }.listStyle(.insetGrouped)
                .toolbar {
                    ToolbarItem {
                        Button(
                            "Settings", systemImage: "gearshape",
                            action: { isShowingSheet.toggle() }
                        )
                        .sheet(isPresented: $isShowingSheet) {
                            SettingsView()
                        }
                    }
                }
                .navigationTitle("Write Me")
        } detail: {
            Text("Select an item")
        }
    }
}

#Preview { RootPage().modelContainer(for: Project.self, inMemory: false) }
