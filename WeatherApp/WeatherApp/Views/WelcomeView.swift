//
//  WelcomeView.swift
//  WeatherApp
//
//  Created by Harish Pathak on 18/01/22.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack {
            VStack {
                Text("Welcome to the Weather App")
                    .bold().font(.title)
                Text("Please share your current location to fetch the wetaher in your area.")
                    .padding()
                
                LocationButton(.shareCurrentLocation) {
                    locationManager.requestLocation()
                }
                .cornerRadius(8)
                .symbolVariant(.fill)
                .foregroundColor(.white)
                
            }
            .multilineTextAlignment(.center)
            .padding()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
