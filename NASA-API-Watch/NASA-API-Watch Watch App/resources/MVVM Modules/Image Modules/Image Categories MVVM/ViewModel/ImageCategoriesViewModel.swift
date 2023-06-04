//
//  ImageCategoriesViewModel.swift
//  NASA-API-Watch Watch App
//
//  Created by Марк Киричко on 30.04.2023.
//

import Foundation

class ImageCategoriesViewModel: ObservableObject {
    
    @Published var categories = [ImageCategoryModel(id: 1, name: "APOD", icon: "camera", itemsCount: 0), ImageCategoryModel(id: 2, name: "Фото Марса", icon: "mars", itemsCount: 0), ImageCategoryModel(id: 3, name: "NASA Медиатека", icon: "", itemsCount: 0), ImageCategoryModel(id: 4, name: "EPIC", icon: "EPIC", itemsCount: 0)]
    
    private let nasaService = NASAService()
    private let epicImagesListViewModel = EPICImagesListViewModel()
    
    init() {
        GetImageCategoriesInfo()
    }
    
    func GetImageCategoriesInfo() {
        // APOD
        nasaService.execute(type: Apod.self, response: .apod) { [weak self] result in
            switch result {
            case .success(let data):
                self?.categories[0].icon = data.url ?? ""
                self?.categories[0].itemsCount = 1
            case .failure(let error):
                print(error)
            }
        }
        // Фото Марса
        nasaService.execute(type: MarsImage.self, response: .marsphotos) { [weak self] result in
            switch result {
            case .success(let data):
                self?.categories[1].icon = data.photos[0].imgSrc
                self?.categories[1].itemsCount = data.photos.count
            case .failure(let error):
                print(error)
            }
        }
        
        // NASA медиатека
        nasaService.execute(type: NASAImageAndVideoLibrary.self, response: .nasaimages) { [weak self] result in
            switch result {
            case .success(let data):
                var images = [NASAImageViewModel]()
                let data = data.collection.items
                DispatchQueue.main.async {
                    for item in data {
                        for image in item.links {
                            for info in item.data {
                                images.append(NASAImageViewModel(image: image.href, title: info.title, description: info.description508 ?? ""))
                            }
                            self?.categories[2].icon = images[0].image
                            self?.categories[2].itemsCount = images.count
                        }
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
        
        // EPIC
        nasaService.execute(type: [EPIC].self, response: .epic) { [weak self] result in
            switch result {
            case .success(let data):
                self?.categories[3].icon = self!.epicImagesListViewModel.SetUpImageURL(epic: data[0])
                self?.categories[3].itemsCount = data.count
            case .failure(let error):
                print(error)
            }
        }
    }
}
