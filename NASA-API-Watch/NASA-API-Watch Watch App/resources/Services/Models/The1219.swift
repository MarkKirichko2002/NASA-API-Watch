//
//  The1219.swift
//  NASA-API-Watch Watch App
//
//  Created by Марк Киричко on 30.04.2023.
//

import Foundation

// MARK: - The1219
struct The1219: Codable {
    let at, hws, pre, wd: At

    enum CodingKeys: String, CodingKey {
        case at = "AT"
        case hws = "HWS"
        case pre = "PRE"
        case wd = "WD"
    }
}
