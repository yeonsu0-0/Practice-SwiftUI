//
//  ViewModel.swift
//  MVVM-Pattern-WeatherApp
//
//  Created by yeonsu on 10/6/23.
//

import Foundation


// Data needed by view

class WeatherViewModel: ObservableObject {
    @Published var name: String = "-"
    @Published var descroptionText: String = "-"
    @Published var temporature: String = "-"
    
    init() {
        fetchWeather()
    }
    
    func fetchWeather() {
        guard let url = URL(string: "") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            // 데이터를 모델로 변환하기
            do {
                let model = try JSONDecoder().decode(WeatherModel.self, from: data)
                DispatchQueue.main.async {
                    self.name = model.name
                    self.temporature = "\(model.main.temp)"
                    self.descroptionText = model.weather.first?.description ?? "No Description"
                }
            } catch {
                print("failed")
            }
        }
        task.resume()
    }
}
