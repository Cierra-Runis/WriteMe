//
//  WorksPage.swift
//  Write Me
//
//  Created by Runis Cierra on 2024/5/20.
//

import SwiftUI

struct ProjectsPage: View {
    @Environment(\.editMode) var editMode

    var body: some View {
        Grid(alignment: .bottom, horizontalSpacing: 8, verticalSpacing: 8) {
            GridRow {
                Text("Row")
                Text("Row")
                Text("Row")
            }
            GridRow {
                Text("Row")
                Text("Row")
                Text("Row")
            }
        }.navigationTitle("My Works")
    }
}

#Preview {
    ProjectsPage()
}
