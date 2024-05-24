//
//  WorksPage.swift
//  Write Me
//
//  Created by Runis Cierra on 2024/5/20.
//

import SwiftData
import SwiftUI

struct ProjectsPage: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var projects: [Project]
    @State private var isShowingSheet = false

    var body: some View {
        NavigationStack {
            ScrollView {
                if self.projects.isEmpty {
                    ZStack {
                        Spacer().containerRelativeFrame([.horizontal, .vertical])
                        Text("Please Create a New Project First")
                    }
                }
                else {
                    LazyVGrid(
                        columns: Array(repeating: .init(.flexible(), spacing: 8), count: 4),
                        spacing: 8
                    ) {
                        ForEach(self.projects) { project in
                            ProjectCard(project: project)
                        }
                    }
                }
            }
            .padding(8)
            .toolbar {
                Button(
                    "Create New Project",
                    systemImage: "plus",
                    action: { self.isShowingSheet.toggle() }
                ).sheet(
                    isPresented: self.$isShowingSheet,
                    content: {
                        CreateNewProjectSheet { self.isShowingSheet.toggle() }.presentationDetents([.medium])
                    }
                )
            }
            .navigationTitle("My Works")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ProjectsPage().modelContainer(for: Project.self, inMemory: false)
}


/// https://medium.com/@mhmtkrnlk/how-to-validate-textfields-in-swiftui-like-a-pro-3dbe368d1570

struct ValidationPreferenceKey: PreferenceKey {
    static var defaultValue: [String?] = .init()
    static func reduce(value: inout [String?], nextValue: () -> [String?]) {
        value += nextValue()
    }
}

struct ValidationModifier: ViewModifier {
    let validation: () -> String?
    func body(content: Content) -> some View {
        content.preference(
            key: ValidationPreferenceKey.self, value: [self.validation()]
        )
    }
}

extension TextField {
    func validate(_ flag: @escaping () -> String?) -> some View {
        self.modifier(ValidationModifier(validation: flag))
    }
}

extension SecureField {
    func validate(_ flag: @escaping () -> String?) -> some View {
        self.modifier(ValidationModifier(validation: flag))
    }
}

struct TextFormView<Content: View>: View {
    @State var validationSeeds: [String?] = []
    @ViewBuilder var content: (@escaping () -> [String]) -> Content

    var body: some View {
        self.content(
            self.validate
        )
        .onPreferenceChange(ValidationPreferenceKey.self) { value in
            self.validationSeeds = value
        }
    }

    private func validate() -> [String] {
        var errors: [String] = []
        for seed in self.validationSeeds {
            if seed != nil { errors.append(seed!) }
        }
        return errors
    }
}
