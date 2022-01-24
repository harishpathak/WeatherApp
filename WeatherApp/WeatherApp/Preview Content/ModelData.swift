//
//  ModelData.swift
//  WeatherApp
//
//  Created by Harish Pathak on 19/01/22.
//

import Foundation

//https://api.openweathermap.org/data/2.5/weather?lat=27.2046&lon=77.4977&appid=fd7098d92db330652c5b9c9df3783859&units=metric
var previewWeather: ResponseBody = load("weatherData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
