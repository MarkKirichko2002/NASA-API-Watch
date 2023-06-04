//
//  MarsPhotosListViewModel.swift
//  NASA-API-Watch Watch App
//
//  Created by Марк Киричко on 29.04.2023.
//

import Foundation

class MarsPhotosListViewModel: ObservableObject {
    
    @Published var photos = [Photo]()
    
    init() {
        GetMarsPhotos()
    }
    
    func GetMarsPhotos() {
        NASAService.shared.execute(type: MarsImage.self, response: .marsphotos) { result in
            switch result {
            case .success(let data):
                self.photos = data.photos
            case .failure(let error):
                print(error)
            }
        }
    }
}
