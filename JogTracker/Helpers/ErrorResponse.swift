//
//  ErrorResponse.swift
//  JogTracker
//
//  Created by Valeriy Kovalevskiy on 1/14/20.
//  Copyright © 2020 ValeriyKovalevskiy. All rights reserved.
//

import Foundation

struct ErrorResponse: Decodable, LocalizedError {
    let reason: String
    
    var errorDescription: String? { return reason }
}

enum NetworkingError: Error {
    case badUrl
    case badResponse
}
