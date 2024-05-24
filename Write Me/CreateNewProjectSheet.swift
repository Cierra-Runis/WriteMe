//
//  CreateNewProjectSheet.swift
//  Write Me
//
//  Created by Runis Cierra on 2024/5/24.
//

import SwiftUI
import SwiftData

struct CreateNewProjectSheet: View {
    @State private var project: Project = .init()
    @Environment(\.modelContext) private var modelContext
    @Query private var projects: [Project]

    let dismissAction: () -> Void

    var body: some View {
        NavigationStack {
            TextFormView {
                validate in
                List {
                    Section("Basic Info") {
                        TextField(
                            "Enter Project Name Here", text: self.$project.name
                        ).validate {
                            if self.projects.contains(where: { $0.name == project.name }) {
                                return "The Name of \(self.project.name) has Existed"
                            }
                            if self.project.name.count == 0 {
                                return "The Length of Project Name must be Greater than 0"
                            }
                            return nil
                        }
                    }
                }.listStyle(
                    .insetGrouped
                )
                .toolbar {
                    Button(
                        "Submit",
                        action: {
                            let errors = validate()
                            print(errors)
                            if !errors.isEmpty { return }
                            self.modelContext.insert(self.project)
                            self.dismissAction()
                        }
                    )
                }.navigationTitle(
                    "Create New Project"
                ).navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    CreateNewProjectSheet { print("Submited") }.modelContainer(for: Project.self, inMemory: false)
}
