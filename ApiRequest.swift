//
//  ApiRequest.swift
//  catchesapp
//
//  Created by Ruzanna Ghazaryan on 6/18/18.
//

import Foundation

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

class ApiRequest<ResponseType: ApiResponse> {
    var path: String
    var method: HttpMethod
    var body: Data?
    var isAuthorized: Bool

    init<T: Encodable>(path: String, method: HttpMethod, data: T? = nil, isAuthorized: Bool = false) {
        let queryCharSet = NSCharacterSet.urlQueryAllowed
        self.path = path.addingPercentEncoding(withAllowedCharacters: queryCharSet)!
        self.method = method
        self.body = try? JSONEncoder().encode(data)
        self.isAuthorized = isAuthorized
    }

    init(path: String, method: HttpMethod, isAuthorized: Bool = false) {
        let queryCharSet = NSCharacterSet.urlQueryAllowed
        self.path = path.addingPercentEncoding(withAllowedCharacters: queryCharSet)!
        self.method = method
        self.isAuthorized = isAuthorized
    }
}
