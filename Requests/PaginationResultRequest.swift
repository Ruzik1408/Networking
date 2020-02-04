//
//  GetUserPostsRequest.swift
//  catchesapp
//
//  Created by Ruzanna Ghazaryan on 9/14/18.
//

import Foundation

class PaginationResultRequest<T: Codable>: ApiRequest<PaginationResultResponse<T>> {
    
}

class GetInfluencersFeedRequest: PaginationResultRequest<Post> {
    let query: String
    let page:Int
    let pageSize:Int
    let measurements:Bool
    
    init(measurements:Bool, query:String , page:Int, pageSize:Int) {
        self.measurements = measurements
        self.query = query
        self.page = page
        self.pageSize = pageSize
        let trimmedQuery: String = query.trimmingCharacters(in: .whitespacesAndNewlines)
        super.init(path: "/feed/influencers?pageSize=\(pageSize)&page=\(page)&measurements=\(measurements)&query=\(trimmedQuery)", method: .get, isAuthorized: true)
    }
}

class GetBrandsFeedRequest: PaginationResultRequest<Post> {
    let query: String
    let page:Int
    let pageSize:Int
    let measurements:Bool
    
    init(measurements:Bool, query:String , page:Int, pageSize:Int) {
        self.measurements = measurements
        self.query = query
        self.page = page
        self.pageSize = pageSize
        let trimmedQuery: String = query.trimmingCharacters(in: .whitespacesAndNewlines)
        super.init(path: "/feed/brands?pageSize=\(pageSize)&page=\(page)&measurements=\(measurements)&query=\(trimmedQuery)", method: .get, isAuthorized: true)
    }
}

class GetUserPostsRequest: PaginationResultRequest<Post> {
    init(userId: String, page: Int, pageSize:Int) {
        super.init(path: "/user/\(userId)/posts?pageSize=\(pageSize)&page=\(page)", method: .get, isAuthorized: true)
    }
}

class GetUserHotpicksRequest: PaginationResultRequest<ProductV2> {
    init(userId: String, page: Int) {
        super.init(path: "/user/\(userId)/hotpicks?pageSize=20&page=\(page+1)", method: .get, isAuthorized: true)
    }
}

class GetUserVideoPostsRequest: PaginationResultRequest<VideoPost> {
    init(userId: String, page: Int) {
        super.init(path: "/user/\(userId)/posts/video?pageSize=20&page=\(page)", method: .get, isAuthorized: true)
    }
}

class GetMessagesRequest: PaginationResultRequest<Message> {
    init(conversationId: String, page: Int) {
        super.init(path: "/conversation/\(conversationId)/messages?pageSize=10&page=\(page)", method: .get, isAuthorized: true)
    }
}

class GetPostsByHashtagRequest: PaginationResultRequest<Post> {
    init(hashtagId: String,page: Int) {
        super.init(path: "/hashtag/\(hashtagId)/posts?pageSize=20&page=\(page)", method: .get, isAuthorized: true)
    }
}

class GetVideoPostsByHashtagRequest: PaginationResultRequest<VideoPost> {
    init(hashtagId: String,page: Int) {
        super.init(path: "/hashtag/\(hashtagId)/videoPosts?pageSize=20&page=\(page)", method: .get, isAuthorized: true)
    }
}

class GetPostsByStyleRequest: PaginationResultRequest<Post> {
    init(styleId: String, page: Int) {
        super.init(path: "/style/\(styleId)/posts?pageSize=20&page=\(page)", method: .get, isAuthorized: true)
    }
}

class GetCommentsRequest: PaginationResultRequest<Comment> {
    init(postId: String) {
        super.init(path: "/post/\(postId)/comments", method: .get, isAuthorized: true)
    }
}

class GetLikedPostsRequest: PaginationResultRequest<Post> {
    init(page: Int) {
        super.init(path: "/post/liked?pageSize=20&page=\(page)", method: .get, isAuthorized: true)
    }
}

class GetSwipedPostsRequest: PaginationResultRequest<Post> {
    init(page: Int) {
        super.init(path: "/post/swiped?pageSize=20&page=\(page)", method: .get, isAuthorized: true)
    }
}

class GetSwipedProductsRequest: PaginationResultRequest<ProductV2> {
    init(page: Int) {
        super.init(path: "/v2/product/swiped?pageSize=20&page=\(page + 1)", method: .get, isAuthorized: true)
    }
}

class GetSavedPostsRequest: PaginationResultRequest<Post> {
    init(page: Int) {
        super.init(path: "/post/saved?pageSize=20&page=\(page)", method: .get, isAuthorized: true)
    }
}

class GetProductPostsRequest: PaginationResultRequest<Post> {
	init(productPartNumber: String, page: Int) {
		super.init(path: "/v2/product/\(productPartNumber)/posts?pageSize=20&page=\(page)", method: .get, isAuthorized: true)
	}
}

class GetFavoriteProductsRequest: PaginationResultRequest<ProductV2> {
    init(page: Int) {
        super.init(path: "/v2/product/favorites?pageSize=20&page=\(page + 1)", method: .get, isAuthorized: true)
    }
}

class GetNotificationsRequest: PaginationResultRequest<UserNotification> {
    init(page: Int, pageSize:Int) {
        super.init(path: "/notification?pageSize=\(pageSize)&page=\(page)", method: .get, isAuthorized: true)
    }
}

class GetSalesNotificationsRequest: PaginationResultRequest<SaleNotification> {
    init(page: Int, pageSize:Int) {
        super.init(path: "/notification/sales?pageSize=\(pageSize)&page=\(page)", method: .get, isAuthorized: true)
    }
}

class GetSuggestionFeedRequest: PaginationResultRequest<SuggestionFeed> {
    init(page: Int, pageSize:Int) {
        super.init(path: "/feed/suggestions?pageSize=\(pageSize)&page=\(page)", method: .get, isAuthorized: true)
    }
}

class GetOrdersHistoryRequest: PaginationResultRequest<OrderV2> {
	init(page: Int, pageSize:Int, period:String, shoppingCartId: String? = nil) {
		var path = "/v2/order?pageSize=\(pageSize)&page=\(page+1)&period=\(period)"
		if let cartId = shoppingCartId {
			path.append("&shoppingCartId=\(cartId)")
		}
        super.init(path: path, method: .get, isAuthorized: true)
    }
}

class GetInfluencerOrdersRequest: PaginationResultRequest <OrderV2> {
    init(page: Int, pageSize:Int, period:String) {
        super.init(path: "/statistics/influencer/orders?pageSize=\(pageSize)&page=\(page)&period=\(period)", method: .get, isAuthorized: true)
    }
}

class GetPublicEventsRequest: PaginationResultRequest <Event> {
    init() {
        super.init(path: "/publicevent/events?pageSize=100", method: .get, isAuthorized: true)
    }
}

class GetBoutiquesRequest: PaginationResultRequest <Boutique> {
    init() {
        super.init(path: "/boutique/boutiques?pageSize=100", method: .get, isAuthorized: true)
    }
}

enum PaginationResultResponse<T: Codable>: ApiResponse {
    
    typealias DataType = PaginationResult<T>
    
    case loaded(data: DataType)
    case notFound
    case error
    
    static func successResponse(with code: Int, data: DataType?) -> PaginationResultResponse {
        switch code {
        case 200:
            guard let data = data else {
                return .error
            }
            return .loaded(data: data)
        default:
            return .error
        }
    }
    
    static func errorResponse(with code: Int, data: ApiError?) -> PaginationResultResponse {
        switch code {
        case 404:
            return .notFound
        default:
            return .error
        }
    }
}
