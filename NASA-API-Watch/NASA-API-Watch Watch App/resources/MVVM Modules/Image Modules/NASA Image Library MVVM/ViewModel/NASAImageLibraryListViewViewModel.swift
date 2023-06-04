//
//  NASAImageLibraryListViewViewModel.swift
//  NASA-API-Watch Watch App
//
//  Created by Марк Киричко on 08.05.2023.
//

import Foundation

class NASAImageLibraryListViewViewModel: ObservableObject {
    
    @Published var images = [NASAImageLibraryCollectionViewCellViewModel]()
    private let nasaService = NASAService()
    
    init() {
        GetNASAImages()
    }
    
    func GetNASAImages() {
        nasaService.execute(type: NASAImageAndVideoLibrary.self, response: .nasaimages) { [weak self] result in
            switch result {
            case .success(let data):
                let data = data.collection.items
                DispatchQueue.main.async {
                    for item in data {
                        for image in item.links {
                            for info in item.data {
                                self?.images.append(NASAImageLibraryCollectionViewCellViewModel(NASAImage: image.href, NASAImageTitle: info.title))
                            }
                        }
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
