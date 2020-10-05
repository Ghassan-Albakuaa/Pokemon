//
//  NetworkError.swift
//  Pokemon
//
//  Created by Ghassan  albakuaa  on 10/4/20.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case serverError(String)
    case badData
    case decodeError
}

extension NetworkError: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
        case .badURL:
            return NSLocalizedString("Bad URL", comment: "Bad URL")
        case .badData:
            return NSLocalizedString("Bad data", comment: "Bad Data")
        case .serverError(let description):
            return NSLocalizedString(description, comment: "Server Error")
        case .decodeError:
            return NSLocalizedString("Decoding Failure", comment: "Decode Failure")
         
        }
    }
    
}

