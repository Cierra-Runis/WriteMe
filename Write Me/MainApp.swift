//
//  Write_MeApp.swift
//  Write Me
//
//  Created by Runis Cierra on 2024/5/20.
//

import SwiftData
import SwiftUI

@main
struct MainApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Project.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            RootPage()
        }
        .modelContainer(sharedModelContainer)
    }
}
