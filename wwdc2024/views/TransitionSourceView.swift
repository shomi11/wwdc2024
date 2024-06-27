//
//  TransitionSourceView.swift
//  wwdc2024
//
//  Created by MMMBP on 6/27/24.
//

import SwiftUI

struct TransitionSourceView: View {
    var body: some View {
        TabView {
            Tab("Example1", systemImage: "bell") {
                TransitionExampleView1()
            }
            Tab("Example2", systemImage: "bell") {
                TransitionExampleView2()
            }
        }
        .tabViewStyle(.sidebarAdaptable)
    }
}

#Preview {
    TransitionSourceView()
}


struct TransitionExampleView1: View {
    
    @Namespace var animation
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [.init(.adaptive(minimum: 250, maximum: 400), spacing: 32, alignment: .center)]) {
                    ForEach(1...10, id: \.self) { index in
                        NavigationLink {
                            ZoomedInView()
                            .navigationTransition(.zoom(sourceID: index, in: animation))
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20, style: .continuous)
                                    .fill(Color.red)
                                    .frame(minHeight: 200)
                                Text("\(index)")
                                    .font(.largeTitle)
                                    .bold()
                                    .foregroundStyle(.white)
                            }
                        }
                        .matchedTransitionSource(id: index, in: animation)
                    }
                }
            }
            .safeAreaPadding(16)
        }
    }
}

struct TransitionExampleView2: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [.init(.adaptive(minimum: 250, maximum: 400), spacing: 32, alignment: .center)]) {
                    ForEach(1...10, id: \.self) { index in
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(Color.blue)
                            .frame(minHeight: 200)
                    }
                }
            }
            .safeAreaPadding(16)
        }
    }
}

struct ZoomedInView: View {
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(Color.red)
                    .frame(minHeight: 200)
                Text("This something new")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.white)
            }
            Text("matchedTransitionSource(id: index, in: animation)")
        }
    }
}
