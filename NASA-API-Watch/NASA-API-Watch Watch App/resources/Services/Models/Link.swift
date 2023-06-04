//
//  Link.swift
//  NASA-API-Watch Watch App
//
//  Created by Марк Киричко on 08.05.2023.
//

import Foundation

// MARK: - Link
struct Link: Codable {
    let href: String
    let rel: String
    let render: String?
}

