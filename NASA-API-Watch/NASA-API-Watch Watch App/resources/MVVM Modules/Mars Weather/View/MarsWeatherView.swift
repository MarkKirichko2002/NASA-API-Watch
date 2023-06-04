//
//  MarsWeatherView.swift
//  NASA-API-Watch Watch App
//
//  Created by Марк Киричко on 30.04.2023.
//

import SwiftUI

struct MarsWeatherView: View {
    
    @ObservedObject var viewModel = MarsWeatherViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.weather.sorted(by: >), id: \.key) { key, value in
                Section(header: Text(key)) {
                    Text(value)
                }
            }
        }.navigationBarTitle("Марс Погода")
    }
}

struct MarsWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        MarsWeatherView()
    }
}
