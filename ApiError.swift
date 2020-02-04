//
//  ApiError.swift
//  catchesapp
//
//  Created by Ruzanna Ghazaryan on 6/18/18.
//

import Foundation

class ApiError: Error, Decodable {
    var code: Int!
    var message: String?

    private enum CodingKeys: String, CodingKey {
        case code = "status"
        case message = "error"
    }
}

enum NonApiError: Error {
    case requestFailed
    case invalidData
    case jsonDecodingFailure
    case unknownError
}
