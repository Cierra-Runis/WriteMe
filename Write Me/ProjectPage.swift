//
//  ProjectPage.swift
//  Write Me
//
//  Created by Runis Cierra on 2024/5/20.
//

import SwiftUI

struct ProjectPage: View {
    let project: Project
    let pageSize = 100 // 每页显示的码位数量
    @State private var unicodeScalars = UInt32.min ... UInt32.max //  Unicode 码位范围

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(
                    columns: Array(repeating: .init(.flexible(), spacing: 25.0), count: 6)
                ) {
                    ForEach(unicodeScalars, id: \.self) { scalar in
                        Text(UnicodeScalar(scalar)?.description ?? "ERROR")
                            .font(.custom("Plangothic", size: 36))
                            .containerShape(RoundedRectangle(cornerRadius: 25.0)).aspectRatio(1, contentMode: .fill)
                    }
                }
            }
            .navigationTitle("Project Page - \(project.name)")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    ProjectPage(
        project: Project(
            name: "Diphylleia",
            createAt: Date(year: 2024, month: 01, day: 01, hour: 08, minute: 00),
            editAt: Date(year: 2024, month: 04, day: 01, hour: 08, minute: 00)
        )
    ).modelContainer(for: Project.self, inMemory: false)
}
