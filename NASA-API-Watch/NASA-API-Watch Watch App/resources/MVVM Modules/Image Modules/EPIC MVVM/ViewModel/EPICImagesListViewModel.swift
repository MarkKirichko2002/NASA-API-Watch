//
//  EPICImagesListViewModel.swift
//  NASA-API-Watch Watch App
//
//  Created by Марк Киричко on 29.04.2023.
//

import Foundation

class EPICImagesListViewModel: ObservableObject {
    
    @Published var epicimages = [EPIC]()
    
    init() {
        GetEPICImages()
    }
    
    func GetEPICImages() {
        NASAService.shared.execute(type: [EPIC].self, response: .epic) { [weak self] result in
            switch result {
            case .success(let data):
                self?.epicimages = data
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func SetUpImageURL(epic: EPIC)->String {
        var image = ""
        image = epic.image
        image += ".png"
        let dateString = epic.date
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss 'UTC'"
        let date = formatter.date(from: dateString)
        formatter.dateFormat = "yyyy"
        let year = formatter.string(from: date!)
        formatter.dateFormat = "MM"
        let month = formatter.string(from: date!)
        formatter.dateFormat = "dd"
        let day = formatter.string(from: date!)
        let totaldate = year + "/" + month + "/" + day
        return "https://epic.gsfc.nasa.gov/archive/natural/\(totaldate)/png/\(image)"
    }
}
