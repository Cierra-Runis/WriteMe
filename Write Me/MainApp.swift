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

extension Font {
    var pointSize: CGFloat {
        let fontStyleMapping: [Font: UIFont.TextStyle] = [
            .largeTitle: .largeTitle,
            .title: .title1,
            .title2: .title2,
            .title3: .title3,
            .headline: .headline,
            .subheadline: .subheadline,
            .body: .body,
            .callout: .callout,
            .footnote: .footnote,
            .caption: .caption1,
            .caption2: .caption2,
        ]
        if let textStyle = fontStyleMapping[self] {
            return UIFont.preferredFont(forTextStyle: textStyle).pointSize
        } else {
            return UIFont.systemFont(ofSize: UIFont.systemFontSize).pointSize
        }
    }
}

extension UInt16 {
    func toHexString(uppercase: Bool = true, prefix: String = "") -> String {
        return "\(prefix)\(String(self, radix: 16, uppercase: uppercase))"
    }
}
