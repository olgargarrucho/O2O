//
//  ProductModelResponse.swift
//  O2O
//
//  Created by Olga Rodríguez Garrucho on 25/5/23.
//

import Foundation

struct ProductModelResponse: Codable {
    let id: Int?
    let name: String?
    let tagline: String?
    let firstBrewed: String?
    let description: String?
    let imageURL: String?
    let abv: Double?
    let ibu: Int?
    let ph: Double?
    let ingredients: IngredientsModelResponse?
    let foodPairing: [String]?
    let brewersTips: String?


    enum CodingKeys: String, CodingKey {
        case id
        case name
        case tagline
        case firstBrewed = "first_brewed"
        case description
        case imageURL = "image_url"
        case abv
        case ibu
        case ph
        case ingredients
        case foodPairing = "food_pairing"
        case brewersTips = "brewers_tips"
    }
}
