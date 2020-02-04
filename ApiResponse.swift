//
//  ApiResponse.swift
//  catchesapp
//
//  Created by Ruzanna Ghazaryan on 7/8/18.
//

import Foundation

protocol ApiResponse {
    associatedtype DataType
    static func parseSuccessResponse(with code: Int, data: Data?) -> Self
    static func successResponse(with code: Int, data: DataType?) -> Self
    static func errorResponse(with code: Int, data: ApiError?) -> Self
}

extension ApiResponse {
    static func parseResponse(with code: Int, data: Data?) -> Self {
        switch code {
        case 200..<300:
            //check response in json
//            let urlContent = NSString(data: data!, encoding: String.Encoding.ascii.rawValue)
//            print(urlContent ?? "aaaa")
            return parseSuccessResponse(with: code, data: data)
        case 400..<500, 500..<600:
            let errorData = try? parseData(type: ApiError.self, data: data)
            return errorResponse(with: code, data: errorData)
        default:
            return errorResponse(with: code, data: nil)
        }
    }
    
    static func parseData<T: Decodable>(type: T.Type, data: Data?) throws -> T {
        if let data = data {
            do {
                return try JSONDecoder.decoder().decode(type, from: data)
            } catch let jsonErr {
                print("Decoding error: \(jsonErr)")
                throw NonApiError.jsonDecodingFailure
            }
        } else {
            throw NonApiError.invalidData
        }
    }
}
extension ApiResponse where DataType == Void {
    static func parseSuccessResponse(with code: Int, data: Data?) -> Self {
        return successResponse(with: code, data: nil)
    }
}
extension ApiResponse where DataType: Decodable {
    static func parseSuccessResponse(with code: Int, data: Data?) -> Self {
        let responseData = try? parseData(type: DataType.self, data: data)
        return successResponse(with: code, data: responseData)
    }
}
