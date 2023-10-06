//
//  Models.swift
//  MVVM-Pattern-WeatherApp
//
//  Created by yeonsu on 10/6/23.
//

import Foundation


// Data


struct WeatherModel: Codable {
    let name: String
    let main: MainWeather
    let weather: [CurrentWeather]
}

struct MainWeather: Codable {
    let temp: Float
}

struct CurrentWeather: Codable {
    let description: String
}
