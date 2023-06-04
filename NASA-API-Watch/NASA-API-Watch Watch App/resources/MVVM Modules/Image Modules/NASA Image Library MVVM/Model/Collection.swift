//
//  Collection.swift
//  NASA-API-Watch Watch App
//
//  Created by Марк Киричко on 08.05.2023.
//

import Foundation

// MARK: - Collection
struct Collection: Codable {
    let version: String
    let href: String
    let items: [Item]
    let metadata: Metadata
}

