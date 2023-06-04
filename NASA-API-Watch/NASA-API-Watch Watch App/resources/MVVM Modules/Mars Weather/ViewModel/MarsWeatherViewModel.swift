//
//  MarsWeatherViewModel.swift
//  NASA-API-Watch Watch App
//
//  Created by Марк Киричко on 30.04.2023.
//

import Foundation

class MarsWeatherViewModel: ObservableObject {
    
    @Published var weather: [String : String] = [:]
    
    init() {
        GetMarsWeather()
    }
    
    func GetMarsWeather() {
        NASAService.shared.execute(type: MarsWeather.self, response: .marsweather) { [weak self] result in
            switch result {
            case .success(let data):
                guard let data = data.validityChecks else {return}
                self?.weather["Sol Hours Required"] = "\(data.solHoursRequired)"
                self?.weather["Sol Checked"] = data.solsChecked.first
                self?.weather["Sol Hours With Data"] = "\(data.the1219.at.solHoursWithData)"
                self?.weather["Valid"] = "\(data.the1219.at.valid)"
            case .failure(let error):
                print(error)
            }
        }
    }
}
