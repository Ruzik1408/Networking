//
//  Post.swift
//  catchesapp
//
//  Created by Ruzanna Ghazaryan on 8/3/18.
//

import Foundation
import IGListKit

class Post: Codable {
    let id: String
    let createdBy: Profile
    let description: String?
    let audioDescriptionUrl: URL?
    var likesCount: Int = 0
    var commentsCount: Int = 0
    var isLiked: Bool? = false
    var isSaved: Bool? = false
    let media: [PostMedia]?
    let hashtags: [Hashtag]?
    let products: [ProductV2]?
    let styles: [PostStyle]?
    let type:String?
    let thumbUrl:String?
    let duration:Int?
	let refLink: String?
    let gender : String?
    init(id: String, likesCount:Int, commentsCount: Int, createdBy: Profile, /*createdAt: Date, */description: String? = nil, audioDescriptionUrl: URL? = nil, media: [PostMedia]? = nil, hashtags: [Hashtag]? = nil,products: [ProductV2]? = nil, styles: [PostStyle]? = nil, isLiked:Bool?, isSaved:Bool?, type:String?, thumbUrl:String?, duration:Int?, refLink: String?, gender: String? ) {
        self.id = id
        self.isLiked = isLiked
        self.isSaved = isSaved
        self.likesCount = likesCount
        self.commentsCount = commentsCount
        self.createdBy = createdBy
//        self.createdAt = createdAt
        self.description = description
        self.audioDescriptionUrl = audioDescriptionUrl
        self.media = media
        self.hashtags = hashtags
        self.products = products
        self.styles = styles
        self.type = type
        self.thumbUrl = thumbUrl
        self.duration = duration
		self.refLink = refLink
        self.gender = gender
    }
}

extension Post {
    class PostMedia: Codable {
        class Size: Codable {
            let width: Int
            let height: Int

            init(width: Int, height: Int) {
                self.width = width
                self.height = height
            }
        }

        let id: String
        let type: String
        let imageUrl: URL?
        let videoUrl: URL?
        let size: Size?
        let duration: Int?

        init(id: String, type: String, imageUrl: URL? = nil, videoUrl: URL? = nil, size: Size? = nil, duration: Int? = nil) {
            self.id = id
            self.type = type
            self.imageUrl = imageUrl
            self.videoUrl = videoUrl
            self.size = size
            self.duration = duration
        }
    }
}
extension Post: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }

    static func == (lhs: Post, rhs: Post) -> Bool {
        return lhs.id == rhs.id
            && lhs.createdBy == rhs.createdBy
//            && lhs.createdAt == rhs.createdAt
            && lhs.description == rhs.description
            && lhs.audioDescriptionUrl == rhs.audioDescriptionUrl
    }
}

extension Post: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return self.hashValue as NSNumber
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let other = object as? Post else { return false }
        return self == other
    }
}
