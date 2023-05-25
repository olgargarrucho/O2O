//
//  IngredientsModelResponse.swift
//  O2O
//
//  Created by Olga Rodríguez Garrucho on 25/5/23.
//

import Foundation

struct IngredientsModelResponse: Codable {
    let malt: [MaltModelResponse]?
    let hops: [HopsModelResponse]?
    let yeast: String?

    enum CodingKeys: String, CodingKey {
        case malt
        case hops
        case yeast
    }
}

struct MaltModelResponse: Codable {
    let name: String?
    let amount: AmountModelResponse?

    enum CodingKeys: String, CodingKey {
        case name
        case amount
    }
}

struct HopsModelResponse: Codable {
    let name: Int?
    let amount: AmountModelResponse?
    let add: String?
    let attribute: String?

    enum CodingKeys: String, CodingKey {
        case name
        case amount
        case add
        case attribute
    }
}

struct AmountModelResponse: Codable {
    let value: Int?
    let unit: String?

    enum CodingKeys: String, CodingKey {
        case value
        case unit
    }
}
