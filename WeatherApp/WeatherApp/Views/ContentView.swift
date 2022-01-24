//
//  ContentView.swift
//  WeatherApp
//
//  Created by Harish Pathak on 18/01/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManger = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
            
            if let location = locationManger.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                    
                } else {
                    LoaderView()
                        .task {
                            do {
                                weather = try await weatherManager.getCurrentWeather(lattitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("Error: \(error)")
                            }
                        }
                }
            } else {
                if locationManger.isLoading {
                    LoaderView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManger)
                }
            }
        }
        .background(Color(red: 0.07, green: 0.089, blue: 0.347))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
