//
//  ApodViewModel.swift
//  NASA-API-Watch Watch App
//
//  Created by Марк Киричко on 29.04.2023.
//

import Foundation

class ApodViewModel: ObservableObject {
    
    @Published var apod: Apod?
    
    init() {
        GetAPOD()
    }
    
    func GetAPOD() {
        NASAService.shared.execute(type: Apod.self, response: .apod) { result in
            switch result {
            case .success(let data):
                self.apod = data
                print(self.apod)
            case .failure(let error):
                print(error)
            }
        }
    }
}
