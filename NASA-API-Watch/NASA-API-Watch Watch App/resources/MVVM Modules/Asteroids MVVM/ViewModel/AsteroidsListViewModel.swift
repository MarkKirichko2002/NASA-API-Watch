//
//  AsteroidsListViewModel.swift
//  NASA-API-Watch Watch App
//
//  Created by Марк Киричко on 30.04.2023.
//

import Foundation

class AsteroidsListViewModel: ObservableObject {
    
    @Published var asteroids = [NearEarthObject]()
    
    init() {
        GetAsteroids()
    }
    
    func GetAsteroids() {
        NASAService.shared.execute(type: Asteroid.self, response: .asteroids) { [weak self] result in
            switch result {
            case .success(let data):
                guard let data = data.nearEarthObjects?["2015-09-07", default: [NearEarthObject]()] else {
                    return
                }
                self?.asteroids = data
            case .failure(let error):
                print(error)
            }
        }
    }
}
