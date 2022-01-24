//
//  LoaderView.swift
//  WeatherApp
//
//  Created by Harish Pathak on 19/01/22.
//

import SwiftUI

struct LoaderView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(.circular)
            .tint(.white)
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView()
    }
}
