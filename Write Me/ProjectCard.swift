//
//  ProjectCard.swift
//  Write Me
//
//  Created by Runis Cierra on 2024/5/20.
//

import SwiftDate
import SwiftUI

struct ProjectCard: View {
    let project: Project
    @State private var isShowingAlert: Bool = false
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        NavigationLink {
            ProjectPage(project: project)
        } label: {
            GeometryReader {
                _ in VStack(alignment: .leading) {
                    Spacer()
                    Text(project.name)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(.primary)
                    Text("Latest Edit At: \(project.editAt.toRelative(since: Date.now.inDefaultRegion(), unitsStyle: .full))")
                        .font(.caption)
                        .foregroundStyle(.secondary)

                }.lineLimit(1)
            }
            .padding(25.0).background(.regularMaterial)
            .containerShape(RoundedRectangle(cornerRadius: 25.0))
            .frame(maxWidth: 400, maxHeight: 400)
            .aspectRatio(1, contentMode: .fit)
        }.foregroundStyle(
            .primary
        )
        .alert(
            Text("Remove \"\(project.name)\"?"), isPresented: $isShowingAlert, actions: {
                Button("Confrim", role: .destructive) {
                    modelContext.delete(project)
                }
                Button("Cancel", role: .cancel) {}
            }, message: {
                Text("You will lose all you data of it")
            }
        ).contextMenu {
            NavigationLink {
                ProjectPage(project: project)
            } label: {
                Label("Open", systemImage: "applepencil.tip")
            }
            Button {} label: {
                Label("Rename", systemImage: "pencil")
            }
            Divider()
            Button(
                role: .destructive, action: { isShowingAlert = true }
            ) {
                Label("Delete", systemImage: "trash")
            }
        }
    }
}

#Preview {
    NavigationStack {
        ProjectCard(
            project: Project(
                name: "Diphylleia",
                createAt: Date(year: 2024, month: 01, day: 01, hour: 08, minute: 00),
                editAt: Date(year: 2024, month: 04, day: 01, hour: 08, minute: 00)
            )
        )
    }.modelContainer(for: Project.self, inMemory: true)
}
