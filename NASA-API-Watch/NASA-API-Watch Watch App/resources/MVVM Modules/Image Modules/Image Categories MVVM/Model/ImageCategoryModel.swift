//
//  ImageCategoryModel.swift
//  NASA-API-Watch Watch App
//
//  Created by Марк Киричко on 29.04.2023.
//

import Foundation

struct ImageCategoryModel: Identifiable {
    let id: Int
    let name: String
    var icon: String
    var itemsCount: Int
}
