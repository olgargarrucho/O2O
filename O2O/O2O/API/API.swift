//
//  API.swift
//  O2O
//
//  Created by Olga Rodríguez Garrucho on 25/5/23.
//

import Foundation

enum APIType {
    case data

    var urlString: String {
        switch self {
        case .data: return "https://api.punkapi.com/v2/beers?food="
        }
    }
}

protocol APIProtocol {
    func fetch<T: Decodable>(_ type: APIType, textSearch: String, completion: @escaping (APITypeResponse<T>) -> Void)
}

final class API: APIProtocol {

    func fetch<T: Decodable>(_ type: APIType, textSearch: String, completion: @escaping (APITypeResponse<T>) -> Void) {
        guard let url = URL(string: type.urlString + textSearch) else {
            completion(.failure(.badURL))
            return
        }
        let session = URLSession(configuration: .default)

        let task = session.dataTask(with: url) { data, response, error in
            guard error == nil else {
                completion(.failure(.init(value: error?.localizedDescription)))
                return
            }
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            guard let decoded = try? JSONDecoder().decode(T.self, from: data) else {
                completion(.failure(.invalidJSON))
                return
            }

            completion(.success(decoded))
        }
        task.resume()
    }

}
