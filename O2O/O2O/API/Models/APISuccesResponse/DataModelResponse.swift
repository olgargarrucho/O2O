//
//  DataModelResponse.swift
//  O2O
//
//  Created by Olga Rodríguez Garrucho on 25/5/23.
//

import Foundation

struct DataModelResponse: Codable {
    let data: [ProductModelResponse]?

    enum CodingKeys: String, CodingKey {
        case data
    }
}
