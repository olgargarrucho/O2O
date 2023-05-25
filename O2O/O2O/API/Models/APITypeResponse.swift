//
//  APITypeResponse.swift
//  O2O
//
//  Created by Olga Rodríguez Garrucho on 25/5/23.
//

import Foundation

enum APITypeResponse<T> {
    case success(T)
    case failure(APIErrorResponse)
}
