//
//  LibraryData.swift
//  NASA-API-Watch Watch App
//
//  Created by Марк Киричко on 08.05.2023.
//

import Foundation

// MARK: - ImageData
struct LibraryData: Codable {
    let center: String
    let title, nasaID: String
    let dateCreated: String
    let mediaType: String
    let dataDescription: String
    let keywords, album: [String]?
    let location, description508, secondaryCreator: String?

    enum CodingKeys: String, CodingKey {
        case center, title
        case nasaID = "nasa_id"
        case dateCreated = "date_created"
        case mediaType = "media_type"
        case dataDescription = "description"
        case keywords, album, location
        case description508 = "description_508"
        case secondaryCreator = "secondary_creator"
    }
}

