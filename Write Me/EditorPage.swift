//
//  EditorPage.swift
//  Write Me
//
//  Created by Runis Cierra on 2024/5/20.
//

import CoreText
import PencilKit
import SwiftUI

struct EditorPage: View {
    let unicode: UInt16

    var unNullableScalar: UnicodeScalar {
        return UnicodeScalar(unicode) ?? UnicodeScalar(0xE001)!
    }

    @State private var canvas = PKCanvasView()
    @State private var isDrawing = true
    @State private var color: Color = .black
    @State private var pencilType: PKInkingTool.InkType = .pen
    @State private var colorPicker = false
    @Environment(\.undoManager) private var undoManager

    @State private var sliderValue = 1.0

    var body: some View {
        NavigationStack {
            ZStack {
                Text("\(unNullableScalar.description)")
                    .font(.custom("Plangothic P1", size: 32 * sliderValue))
                    .font(.custom("Plangothic P2", size: 32 * sliderValue))
                    .foregroundStyle(.secondary)
                    .border(.ultraThinMaterial, width: 0.5)

                DrawingView(canvas: $canvas, isDrawing: $isDrawing, pencilType: $pencilType, color: $color)
                    .border(.ultraThinMaterial, width: 0.5)
                    .toolbar {
                        ToolbarItemGroup(placement: .bottomBar) {
                            Button {
                                undoManager?.undo()
                            } label: {
                                Image(systemName: "arrow.uturn.backward")
                            }

                            Button {
                                undoManager?.redo()
                            } label: {
                                Image(systemName: "arrow.uturn.forward")
                            }

                            Button {
                                isDrawing = true
                                pencilType = .pen
                            } label: {
                                Image(systemName: "applepencil.tip")
                            }

                            Button {
                                isDrawing = false
                            } label: {
                                Image(systemName: "eraser")
                            }

                            Button {
                                // Tool picker
                                // let toolPicker = PKToolPicker.init()
                                @State var toolPicker = PKToolPicker()
                                toolPicker.setVisible(true, forFirstResponder: canvas)
                                toolPicker.addObserver(canvas)
                                canvas.becomeFirstResponder()
                            } label: {
                                Image(systemName: "pencil.tip.crop.circle.badge.plus")
                            }

                            Spacer()

                            Button {
                                saveDrawing()
                            } label: {
                                Image(systemName: "square.and.arrow.down.on.square")
                            }
                        }
                    }
            }.lineLimit(1)
                .padding(25.0).background(.regularMaterial)
                .containerShape(RoundedRectangle(cornerRadius: 25.0))
                .frame(maxWidth: 400, maxHeight: 400)
                .aspectRatio(1, contentMode: .fit)
                .navigationTitle(unicode.toHexString(prefix: "U+"))
                .navigationBarTitleDisplayMode(.inline)

            Slider(value: $sliderValue, in: 0.5 ... 6) {
                Text("\(sliderValue)")
            } minimumValueLabel: {
                Image(systemName: "textformat.size.smaller")
            } maximumValueLabel: {
                Image(systemName: "textformat.size.larger")
            }.frame(maxWidth: 400)
        }
    }

    // Save drawings to Photos
    func saveDrawing() {
        // Get the drawing image from the canvas
        let drawingImage = canvas.drawing.image(from: canvas.drawing.bounds, scale: 1.0)
    }
}

struct DrawingView: UIViewRepresentable {
    @Binding var canvas: PKCanvasView
    @Binding var isDrawing: Bool
    @Binding var pencilType: PKInkingTool.InkType
    @Binding var color: Color

    var ink: PKInkingTool {
        PKInkingTool(pencilType, color: UIColor(color), width: 4)
    }

    let eraser = PKEraserTool(.bitmap)

    func makeUIView(context: Context) -> PKCanvasView {
        canvas.backgroundColor = .clear
        canvas.drawingPolicy = .pencilOnly

        canvas.tool = isDrawing ? ink : eraser
        canvas.alwaysBounceVertical = true

        let toolPicker = PKToolPicker()
        toolPicker.setVisible(true, forFirstResponder: canvas)
        toolPicker.addObserver(canvas) // Notify when the picker configuration changes
        canvas.becomeFirstResponder()

        return canvas
    }

    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        uiView.tool = isDrawing ? ink : eraser
    }
}

#Preview {
    EditorPage(unicode: 0x2F40)
}
