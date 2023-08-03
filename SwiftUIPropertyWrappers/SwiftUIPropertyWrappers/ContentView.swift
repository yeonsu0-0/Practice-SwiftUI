//
//  ContentView.swift
//  SwiftUIPropertyWrappers
//
//  Created by yeonsu on 2023/08/03.
//

import SwiftUI

struct ContentView: View {
    @State private var darkModeEnabled = false
    @State private var showDetailView = false
    @State private var changeTextColorToRed = false
    
    var body: some View {
        
        ZStack {
            Color(darkModeEnabled ? .black : .white)
            VStack {
                Text("Hello World :)")
                    .foregroundColor(changeTextColorToRed ? .red : .black)
                Spacer()
                Toggle(isOn: $darkModeEnabled) {
                    Text("Dark mode")
                        .foregroundColor(darkModeEnabled ? .white : .black)
                }
                Button {
                    showDetailView.toggle()
                } label: {
                    Text("Show Detail View")
                }
            }
            .padding()
        }
        .sheet(isPresented: $showDetailView, content: {
            DetailView(showDetailView: $showDetailView, changeTextColorToRed: $changeTextColorToRed)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
