//
//  NASAImageLibraryCollectionViewCellViewModel.swift
//  NASA-API-Watch Watch App
//
//  Created by Марк Киричко on 08.05.2023.
//

import Foundation

final class NASAImageLibraryCollectionViewCellViewModel: Identifiable {
    public var NASAImage: String
    public var NASAImageTitle: String
    
    init(NASAImage: String, NASAImageTitle: String) {
        self.NASAImage = NASAImage
        self.NASAImageTitle = NASAImageTitle
    }
}

