//
//  AsteroidLinks.swift
//  NASA-API-Watch Watch App
//
//  Created by Марк Киричко on 30.04.2023.
//

import Foundation

// MARK: - AsteroidLinks
struct AsteroidLinks: Codable {
    let next, prev, linksSelf: String?

    enum CodingKeys: String, CodingKey {
        case next, prev
        case linksSelf = "self"
    }
}

