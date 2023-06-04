//
//  Asteroid.swift
//  NASA-API-Watch Watch App
//
//  Created by Марк Киричко on 30.04.2023.
//

import Foundation

// MARK: - Asteroid
struct Asteroid: Codable {
    let links: AsteroidLinks?
    let elementCount: Int?
    let nearEarthObjects: [String: [NearEarthObject]]?

    enum CodingKeys: String, CodingKey {
        case links
        case elementCount = "element_count"
        case nearEarthObjects = "near_earth_objects"
    }
}


