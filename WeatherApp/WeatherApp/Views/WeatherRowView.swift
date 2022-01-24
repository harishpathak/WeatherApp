//
//  WeatherRowView.swift
//  WeatherApp
//
//  Created by Harish Pathak on 24/01/22.
//

import SwiftUI

struct WeatherRowView: View {
    var icon: String
    var name: String
    var value: String
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: icon)
                .font(.title2)
                .frame(width: 20, height: 20)
                .padding()
                .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.888))
                .cornerRadius(50)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(name)
                    .font(.caption)
                Text(value)
                    .font(.title)
                    .bold()
            }
        }
    }
}

struct WeatherRowView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRowView(icon: "thermometer", name: "min temp", value: "12")
    }
}
