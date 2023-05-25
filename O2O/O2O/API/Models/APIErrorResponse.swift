//
//  APIErrorResponse.swift
//  O2O
//
//  Created by Olga Rodríguez Garrucho on 25/5/23.
//

import Foundation

struct APIErrorResponse: Codable {
    var code: String?
    var value: String?

    enum CodingKeys: String, CodingKey {
        case code
        case value
    }

    init(code: String? = nil, value: String? = nil) {
        self.code = code
        self.value = value
    }

    static let badURL: APIErrorResponse = .init(value: NSLocalizedString("The URL format is wrong", comment: ""))
    static let invalidData: APIErrorResponse = .init(value: NSLocalizedString("Invalid data", comment: ""))
    static let invalidJSON: APIErrorResponse = .init(value: NSLocalizedString("The server response didn't match our model", comment: ""))
}
