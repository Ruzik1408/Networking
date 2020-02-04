//
//  SignUpRequest.swift
//  catchesapp
//
//  Created by Ruzanna Ghazaryan on 6/20/18.
//

import Foundation

class SignUpRequest: ApiRequest<SignUpResponse> {
    init(userInfo: ApiModel.SignUp.UserInfo) {
        super.init(path: "/user", method: .post, data: userInfo)
    }
}

enum SignUpResponse: ApiResponse {
    typealias DataType = Profile

    case created(user: DataType)
    case usernameEmailNotAvailable
    case error

    static func successResponse(with code: Int, data: DataType?) -> SignUpResponse {
        switch code {
        case 201:
			guard let data = data else {
				return .error
			}
			return .created(user: data)
        default:
            return .error
        }
    }
    
    static func errorResponse(with code: Int, data: ApiError?) -> SignUpResponse {
        switch code {
        case 409:
            return .usernameEmailNotAvailable
        default:
            return .error
        }
    }
}
