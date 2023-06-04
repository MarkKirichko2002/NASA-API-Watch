//
//  Item.swift
//  NASA-API-Watch Watch App
//
//  Created by Марк Киричко on 08.05.2023.
//

import Foundation

// MARK: - Item
struct Item: Codable {
    let href: String
    let data: [LibraryData]
    let links: [Link]
}

