//
//  PresentationSheetsView.swift
//  wwdc2024
//
//  Created by MMMBP on 6/27/24.
//

import SwiftUI

struct PresentationSheetsView: View {
    
    @State private var showForm: Bool = false
    @State private var showFitted: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
                Button("Show Form") {
                   showForm = true
               }
                .buttonStyle(.borderedProminent)
               
               Button("Show Fitted") {
                   showFitted = true
               }
               .buttonStyle(.borderedProminent)
            }
            .font(.largeTitle)
            .navigationTitle("New Sheets")
            .sheet(isPresented: $showForm) {
                Text("Form")
                    .presentationSizing(.form)
            }
        }
        .sheet(isPresented: $showForm) {
            Text("This Is show form")
                .presentationSizing(.form)
        }
        .sheet(isPresented: $showFitted) {
            Text("This is show fitted")
                .padding()
                .presentationSizing(.fitted)
        }
    }
}

#Preview {
    PresentationSheetsView()
}
