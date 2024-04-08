//
//  APIError.swift
//  StarWarsWiki
//
//  Created by Luan Cabral on 05/04/24.
//

import Foundation

enum APIError: Error, LocalizedError {
    case invalidURL
    case serverError
    case invalidData
    case unkown(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The URL was invalid. Please try again later"
        case .serverError:
            return "There was an error with the server. Please try again later"
        case .invalidData:
            return "The data is invalid. Please try again later"
        case .unkown(let error):
            return error.localizedDescription
        }
    }
}
