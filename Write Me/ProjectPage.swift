//
//  ProjectPage.swift
//  Write Me
//
//  Created by Runis Cierra on 2024/5/20.
//

import SwiftUI

struct ProjectPage: View {
    let project: Project

    @State private var searchingUnicode: String = ""

    // Unicode 码点范围
    let itemsPerPage = 512 // 每页显示的项目数
    @State private var currentPage = 0 // 当前页码

    var currentPageItems: [Unicode.Scalar] {
        let startIndex = currentPage * itemsPerPage
        let endIndex = min(startIndex + itemsPerPage, 0x10FFFF)
        return Array((startIndex...endIndex).compactMap { Unicode.Scalar($0) })
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(
                    columns: [.init(.adaptive(minimum: 200), spacing: 8)],
                    spacing: 8
                ) {
                    ForEach(currentPageItems, id: \.self) { scalar in
                        UnicodeCard(unicode: scalar, color: color(for: scalar.value))
                    }
                }
            }
            .padding(8)
            .toolbar {
                Button(action: { if currentPage > 0 { currentPage -= 1 } })
                    { Text("Previous") }
                    .disabled(currentPage == 0)

                Button(action: { if (currentPage + 1) * itemsPerPage < 0x10FFFF { currentPage += 1 } })
                    { Text("Next") }
                    .disabled((currentPage + 1) * itemsPerPage >= 0x10FFFF)
            }
            .navigationTitle("\(project.name) - Page \(currentPage + 1)")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    func color(for codePoint: UInt32) -> Color {
        switch codePoint {
        case 0x0000...0xFFFF:
            return .blue // Basic Multilingual Plane
        case 0x10000...0x1FFFF:
            return .green // Supplementary Multilingual Plane 1
        case 0x20000...0x2FFFF:
            return .orange // Supplementary Multilingual Plane 2
        case 0x30000...0x3FFFF:
            return .red // Supplementary Multilingual Plane 3
        case 0x40000...0x4FFFF:
            return .purple // Supplementary Multilingual Plane 4
        case 0x50000...0x5FFFF:
            return .yellow // Supplementary Multilingual Plane 5
        case 0x60000...0x6FFFF:
            return .pink // Supplementary Multilingual Plane 6
        case 0x70000...0x7FFFF:
            return .teal // Supplementary Multilingual Plane 7
        case 0x80000...0x8FFFF:
            return .cyan // Supplementary Multilingual Plane 8
        case 0x90000...0x9FFFF:
            return .indigo // Supplementary Multilingual Plane 9
        case 0xA0000...0xAFFFF:
            return .brown // Supplementary Multilingual Plane 10
        case 0xB0000...0xBFFFF:
            return .gray // Supplementary Multilingual Plane 11
        case 0xC0000...0xCFFFF:
            return .mint // Supplementary Multilingual Plane 12
        case 0xD0000...0xDFFFF:
            return .teal // Supplementary Multilingual Plane 13
        case 0xE0000...0xEFFFF:
            return .white // Supplementary Multilingual Plane 14
        case 0xF0000...0xFFFFF:
            return .brown // Supplementary Multilingual Plane 15
        case 0x100000...0x10FFFF:
            return .mint // Supplementary Multilingual Plane 16
        default:
            return .black // Unknown
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
    )
    .modelContainer(for: Project.self, inMemory: false)
}

//
// import SwiftUI
//
// struct ContentView: View {
//    // Unicode 码点范围
//    let codePoints = (0x0000...0x10FFFF).compactMap { Unicode.Scalar($0) }
//    let itemsPerPage = 256 // 每页显示的项目数
//    @State private var currentPage = 0 // 当前页码
//
//    var body: some View {
//        VStack {
//            ScrollView {
//                LazyVGrid(columns: [GridItem(.adaptive(minimum: 40))], spacing: 4) {
//                    ForEach(currentPageItems, id: \.self) { scalar in
//                        Text(scalar.description)
//                            .font(.system(size: 12))
//                            .frame(width: 40, height: 40)
//                            .background(color(for: scalar.value))
//                            .foregroundColor(.white)
//                            .cornerRadius(4)
//                    }
//                }
//                .padding()
//            }
//
//            HStack {
//                Button(action: {
//                    if currentPage > 0 {
//                        currentPage -= 1
//                    }
//                }) {
//                    Text("Previous")
//                }
//                .disabled(currentPage == 0)
//
//                Text("Page \(currentPage + 1)")
//
//                Button(action: {
//                    if (currentPage + 1) * itemsPerPage < codePoints.count {
//                        currentPage += 1
//                    }
//                }) {
//                    Text("Next")
//                }
//                .disabled((currentPage + 1) * itemsPerPage >= codePoints.count)
//            }
//            .padding()
//        }
//    }
//
//    var currentPageItems: [Unicode.Scalar] {
//        let startIndex = currentPage * itemsPerPage
//        let endIndex = min(startIndex + itemsPerPage, codePoints.count)
//        return Array(codePoints[startIndex..<endIndex])
//    }
//
//    func color(for codePoint: UInt32) -> Color {
//        switch codePoint {
//        case 0x0000...0xFFFF:
//            return .blue // Basic Multilingual Plane
//        case 0x10000...0x1FFFF:
//            return .green // Supplementary Multilingual Plane 1
//        case 0x20000...0x2FFFF:
//            return .orange // Supplementary Multilingual Plane 2
//        case 0x30000...0x3FFFF:
//            return .red // Supplementary Multilingual Plane 3
//        case 0x40000...0x4FFFF:
//            return .purple // Supplementary Multilingual Plane 4
//        case 0x50000...0x5FFFF:
//            return .yellow // Supplementary Multilingual Plane 5
//        case 0x60000...0x6FFFF:
//            return .pink // Supplementary Multilingual Plane 6
//        case 0x70000...0x7FFFF:
//            return .teal // Supplementary Multilingual Plane 7
//        case 0x80000...0x8FFFF:
//            return .cyan // Supplementary Multilingual Plane 8
//        case 0x90000...0x9FFFF:
//            return .indigo // Supplementary Multilingual Plane 9
//        case 0xA0000...0xAFFFF:
//            return .brown // Supplementary Multilingual Plane 10
//        case 0xB0000...0xBFFFF:
//            return .gray // Supplementary Multilingual Plane 11
//        case 0xC0000...0xCFFFF:
//            return .mint // Supplementary Multilingual Plane 12
//        case 0xD0000...0xDFFFF:
//            return .lime // Supplementary Multilingual Plane 13
//        case 0xE0000...0xEFFFF:
//            return .olive // Supplementary Multilingual Plane 14
//        case 0xF0000...0xFFFFF:
//            return .chartreuse // Supplementary Multilingual Plane 15
//        case 0x100000...0x10FFFF:
//            return .magenta // Supplementary Multilingual Plane 16
//        default:
//            return .black // Unknown
//        }
//    }
// }
//
// @main
// struct MyApp: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
// }
