//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Harish Pathak on 19/01/22.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 20) {
                
                VStack(alignment: .leading) {
                    Text("\(weather.name)")
                        .font(.system(size: 24))
                        .bold()
                        .foregroundColor(.white)
                    
                    
                    Text("Today, \(Date().formatted(.dateTime.day().month().hour().minute()))")
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
                .padding()
                
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            Image(systemName: "sun.max")
                                .font(.system(size: 40))
                            
                            Text(weather.weather[0].main)
                        }
                        
                        Spacer()
                        
                        Text("\(weather.main.feelsLike.roundDouble())°")
                            .font(.system(size: 100))
                            .bold()
                    }
                
                Spacer()
                
                Image("city")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                
                Spacer()
                }
                .frame(maxWidth:.infinity, alignment: .trailing)
                .padding()
                
                VStack {
                    VStack(alignment: .leading, spacing: 20) {
                        
                        Text("Weather Now")
                            .font(.headline)
                            .padding(.bottom)
                        
                        HStack {
                            WeatherRowView(icon: "thermometer", name: "Min Temp", value: "\(weather.main.tempMin.roundDouble())°")
                            
                            Spacer()
                            
                            WeatherRowView(icon: "thermometer", name: "Max Temp", value: "\(weather.main.tempMax.roundDouble())°")
                        }
                        
                        HStack {
                            WeatherRowView(icon: "humidity", name: "Humidity", value: "\(weather.main.humidity)%")
                            
                            Spacer()
                            
                            WeatherRowView(icon: "wind", name: "Wind Speed", value: "\(weather.wind.speed.roundDouble())m/s")
                        }
                    }
                    
                }
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(red: 0.07, green: 0.089, blue: 0.347))
                .background(Color(.white))
                .frame(maxWidth: .infinity, alignment: .leading)
                .cornerRadius(20, corners: [.topLeft, .topRight])
                
            }
            .frame(maxWidth: .infinity)
            
        }
        .background(Color(red: 0.07, green: 0.089, blue: 0.347))
        .preferredColorScheme(.dark)
        .edgesIgnoringSafeArea(.bottom)
         
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
