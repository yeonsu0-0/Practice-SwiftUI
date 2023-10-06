//
//  ContentView.swift
//  MVVM-Pattern-WeatherApp
//
//  Created by yeonsu on 10/6/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = WeatherViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text(viewModel.name)
                    .font(.system(size: 32))
                Text(viewModel.temporature)
                    .font(.system(size: 44))
                Text(viewModel.descroptionText)
                    .font(.system(size: 24))
            }
            .navigationTitle("Weather MVVM")
        }
    }
}

#Preview {
    ContentView()
}
