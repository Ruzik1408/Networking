//
//  ApiClient.swift
//  catchesapp
//
//  Created by Ruzanna Ghazaryan on 6/18/18.
//

import Foundation

class ApiClient {
    static let shared = ApiClient()

    var baseUrl: URL! {
        didSet {
            //debugPrint("Base URL is \(self.baseUrl)")
        }
    }

    func execute<RequestType: ApiRequest<ResponseType>, ResponseType>(request: RequestType, completion: @escaping (RequestType, ResponseType) -> Void) {
        let urlRequest = createUrlRequest(from: request)
//        debugPrint("Req: \(urlRequest)")
//        if let body = request.body {
//            debugPrint("Body: \(String(data: body, encoding: .utf8))")
//        }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            DispatchQueue.main.async {
                if let response = response {
                    let httpResponse = response as! HTTPURLResponse
                    let response = ResponseType.parseResponse(with: httpResponse.statusCode, data: data)
                    completion(request, response)
                }
            }
        }
        task.resume()
        session.finishTasksAndInvalidate()
    }

    fileprivate func createUrlRequest<RequestType: ApiRequest<ResponseType>, ResponseType>(from apiRequest: RequestType) -> URLRequest {
        var urlRequest = URLRequest(url: URL(string: "/api\(apiRequest.path)", relativeTo: baseUrl)!)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        if apiRequest.isAuthorized {
            if let token = Session.shared.token {
                urlRequest.addValue("Bearer \(token.accessToken)", forHTTPHeaderField: "Authorization")
            }
        }
        urlRequest.httpMethod = apiRequest.method.rawValue
        urlRequest.httpBody = apiRequest.body
        return urlRequest
    }
}
