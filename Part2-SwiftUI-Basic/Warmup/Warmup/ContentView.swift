//
//  ContentView.swift
//  Warmup
//
//  Created by yeonsu on 2/8/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var value = 0
    @State private var name = "Yeonsu"
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "globe")
                .imageScale(/*@START_MENU_TOKEN@*/.large/*@END_MENU_TOKEN@*/)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        }
        VStack {
            
            Button("Hello! \(name)") {
                print("Button is tapped")
            }
            .foregroundColor(.black)
            
            Text("Enter the number of attendees")
            
            Spacer()
            
            Stepper(value: $value, in: 0...5) {
                Text("Current value is \(value)")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
