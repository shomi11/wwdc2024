//
//  MeshGradientView.swift
//  wwdc2024
//
//  Created by MMMBP on 6/25/24.
//

import SwiftUI

struct MeshGradientView: View {
    
    @State private var positionOne: CGPoint = .init(x: 16, y: 8)
    
    @State private var point1: Float = 0.0
    
    @State private var topSlider1: Float = 0.5
    @State private var topSlider2: Float = 0.0
    
    @State private var centerSlider1: Float = 0.5
    @State private var centerSlider2: Float = 0.5
    
    @State private var bottomSlider1: Float = 0.5
    @State private var bottomSlider2: Float = 1.0
    
    @State private var dragOffset: CGSize = .zero
    
    var body: some View {
        VStack(content: {
            GeometryReader { geometry in
                ZStack {
                    MeshGradient(
                        width: 3,
                        height: 3,
                        points: [
                            [0.0, 0.0], [topSlider1, topSlider2], [1.0, 0.0],
                            [0.0, 0.5], [centerSlider1, centerSlider2], [1.0, 0.5],
                            [0.0, 1.0], [bottomSlider1, bottomSlider2], [1.0, 1.0]
                        ],
                        colors: [.orange, .orange, .orange,
                                 .green, .green, .green,
                                 .indigo, .indigo, .indigo]
                    )
                    .clipShape(
                        RoundedRectangle(
                            cornerRadius: 30,
                            style: .continuous
                        )
                    )
                    .padding(.horizontal, 8)
                    
                    Circle()
                        .fill(Color.red)
                        .frame(width: 20, height: 20)
                        .position(x: CGFloat(topSlider1) * geometry.size.width, y: CGFloat(topSlider2) * geometry.size.height)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    self.topSlider1 = max(0, min(1, Float(value.location.x / geometry.size.width)))
                                    self.topSlider2 = max(0, min(1, Float(value.location.y / geometry.size.height)))
                                }
                        )
                    
                    Circle()
                        .fill(Color.black)
                        .frame(width: 20, height: 20)
                        .position(x: CGFloat(centerSlider1) * geometry.size.width, y: CGFloat(centerSlider2) * geometry.size.height)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    self.centerSlider1 = max(0, min(1, Float(value.location.x / geometry.size.width)))
                                    self.centerSlider2 = max(0, min(1, Float(value.location.y / geometry.size.height)))
                                }
                        )
                    
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 20, height: 20)
                        .position(x: CGFloat(bottomSlider1) * geometry.size.width, y: CGFloat(bottomSlider2) * geometry.size.height)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    self.bottomSlider1 = max(0, min(1, Float(value.location.x / geometry.size.width)))
                                    self.bottomSlider2 = max(0, min(1, Float(value.location.y / geometry.size.height)))
                                }
                        )
                }
            }
        })
//        .safeAreaInset(edge: .bottom) {
//            VStack(alignment: .center, spacing: 8) {
//                Slider(value: $topSlider1, in: 0...1) {
//                    
//                } minimumValueLabel: {
//                    Text("0")
//                } maximumValueLabel: {
//                    Text("1")
//                } onEditingChanged: { changed in
//                    
//                }
//                
//                Slider(value: $topSlider2, in: 0...1) {
//                    
//                } minimumValueLabel: {
//                    Text("0")
//                } maximumValueLabel: {
//                    Text("1")
//                } onEditingChanged: { changed in
//                    
//                }
//                
//                Slider(value: $centerSlider1, in: 0...1) {
//                    
//                } minimumValueLabel: {
//                    Text("0")
//                } maximumValueLabel: {
//                    Text("1")
//                } onEditingChanged: { changed in
//                    
//                }
//                
//                Slider(value: $centerSlider2, in: 0...1) {
//                    
//                } minimumValueLabel: {
//                    Text("0")
//                } maximumValueLabel: {
//                    Text("1")
//                } onEditingChanged: { changed in
//                    
//                }
//            }
//            .padding(.horizontal)
//        }
    }
}

#Preview {
    MeshGradientView()
}
