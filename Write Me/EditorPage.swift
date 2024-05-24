//
//  EditorPage.swift
//  Write Me
//
//  Created by Runis Cierra on 2024/5/20.
//

import Charts
import CoreText
import PencilKit
import SwiftUI

struct EditorPage: View {
    let unicode: UnicodeScalar

    @State private var canvas = PKCanvasView()
    @State private var toolPicker = PKToolPicker()

    @State private var isDrawing = true
    @State private var color: Color = .black
    @State private var type: PKInkingTool.InkType = .pen
    @State private var penWidth = 8.0
    @State private var isPenMenuOpen = false
    @State private var isEraserMenuOpen = false

    @State private var sliderValue = 1.0

    @State private var isInspectorOpen = false

    var body: some View {
        VStack {
            ZStack {
                CharacterMetricsView(unicodeScalar: unicode, lineOpacity: sliderValue / 4, fontSize: sliderValue * 36)

                DrawingView(penWidth: $penWidth, canvas: $canvas, isDrawing: $isDrawing, type: $type, color: $color)
                    .navigationTitle("U+\(unicode.value)")
                    .font(.system(size: 35))
                    .onPencilDoubleTap(perform: { _ in isDrawing.toggle() })
            }
            .frame(maxWidth: 400, maxHeight: 400)
            .aspectRatio(1, contentMode: .fill)
            .background(.regularMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                HStack {
                    Button("Switch to Apple Pencil", systemImage: isDrawing ? "pencil.tip.crop.circle.fill" : "pencil.tip.crop.circle")
                        { if isDrawing { isPenMenuOpen = true } else { isDrawing = true } }
                        .popover(isPresented: $isPenMenuOpen) {
                            VStack {
                                HStack {
                                    Text("\(penWidth, specifier: "%.1f") px")
                                    Slider(value: $penWidth, in: 1 ... 32, step: 0.1) {}
                                        .frame(minWidth: 240)
                                }
                                HStack {
                                    Text("Color")
                                    Spacer()
                                    ColorPicker("Colors", selection: $color)
                                }
                            }.padding(10)
                        }

                    Button("Switch to Eraser", systemImage: isDrawing ? "eraser" : "eraser.fill") { isDrawing = false }
                    Button("Undo", systemImage: "arrow.uturn.backward") { canvas.undoManager?.undo() }
                    Button("Redo", systemImage: "arrow.uturn.forward") { canvas.undoManager?.redo() }
                    Button("Inspector", systemImage: isInspectorOpen ? "info.square.fill" : "info.square") { isInspectorOpen.toggle() }
                }
            }

            //        .sheet(isPresented: .constant(true)) {
            //            Text("Detail")
            //                .presentationDetents([.height(200), .height(50)])
            //                .presentationDragIndicator(.visible)
            //                .presentationBackgroundInteraction(.enabled)
            //                .presentationContentInteraction(.scrolls)
            //                .interactiveDismissDisabled()
            //        }

            Slider(value: $sliderValue, in: 0.5 ... 6) {}
                minimumValueLabel: { Image(systemName: "textformat.size.smaller") }
                maximumValueLabel: { Image(systemName: "textformat.size.larger") }
                .frame(maxWidth: 400)
        }.inspector(isPresented: $isInspectorOpen) {
            List {
                Section("Legend") {
                    Label(
                        title: { Text("Ascent") },
                        icon: { Circle().foregroundStyle(.red).frame(width: 10, height: 10) }
                    )
                    Label(
                        title: { Text("Cap Height") },
                        icon: { Circle().foregroundStyle(.orange).frame(width: 10, height: 10) }
                    )
                    Label(
                        title: { Text("X Height") },
                        icon: { Circle().foregroundStyle(.yellow).frame(width: 10, height: 10) }
                    )
                    Label(
                        title: { Text("Baseline") },
                        icon: { Circle().foregroundStyle(.green).frame(width: 10, height: 10) }
                    )
                    Label(
                        title: { Text("Descent") },
                        icon: { Circle().foregroundStyle(.blue).frame(width: 10, height: 10) }
                    )
                }
                UnicodePropertiesView(unicode: unicode)
            }
        }
    }

    // Save drawings to Photos
    func saveDrawing() {
        // Get the drawing image from the canvas
    }
}

struct DrawingView: UIViewRepresentable {
    // to capture drawings for saving into albums
    @Binding var penWidth: Double
    @Binding var canvas: PKCanvasView
    @Binding var isDrawing: Bool
    @Binding var type: PKInkingTool.InkType
    @Binding var color: Color

    // Updating inktype

    var ink: PKInkingTool {
        PKInkingTool(type, color: UIColor(color), width: penWidth)
    }

    let eraser = PKEraserTool(.vector, width: 8)

    func makeUIView(context: Context) -> PKCanvasView {
        canvas.backgroundColor = .clear
        canvas.drawingPolicy = .pencilOnly
        canvas.tool = isDrawing ? ink : eraser

        return canvas
    }

    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        // updating the tool whenever the view updates
        uiView.tool = isDrawing ? ink : eraser
    }
}

#Preview {
    NavigationStack { EditorPage(unicode: "\u{E001}") }
}
