//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Harish Pathak on 19/01/22.
//

import Foundation
import CoreLocation

class WeatherManager {
    
    func getCurrentWeather(lattitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ResponseBody {
        guard let url = URL(string:"https://api.openweathermap.org/data/2.5/weather?lat=\(lattitude)&lon=\(longitude)&appid=fd7098d92db330652c5b9c9df3783859&units=metric") else {
            fatalError("Missing URL")
        }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching weather data")
        }
        
        let responseData = try JSONDecoder().decode(ResponseBody.self, from: data)

        return responseData
    }
    
    
}
