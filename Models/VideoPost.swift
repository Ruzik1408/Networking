//
//  Video.swift
//  catchesapp
//
//  Created by Ruzanna Ghazaryan on 1/18/19.
//

import Foundation
import IGListKit

class VideoPost: Codable {
    let id: String
    let createdBy: Profile
    let externalId: String?
    let externalUrl:String?
    let thumbUrl:String?
    let title:String?
    let description: String?
    let duration:Int?
    var likesCount: Int = 0
    var isLiked: Bool? = false
    var isSaved: Bool? = false
    let hashtags: [Hashtag]?
    let products: [ProductV2]?
    let styles: [PostStyle]?
    
    init(id: String, likesCount:Int, createdBy: Profile, externalId:String, externalUrl:String?, thumbUrl:String?, title:String?,description: String?,duration:Int?,hashtags: [Hashtag]? = nil,products: [ProductV2]? = nil, styles:[PostStyle]? = nil, isLiked:Bool? = nil ,isSaved:Bool? = nil) {
        self.id = id
        self.createdBy = createdBy
        self.externalId = externalId
        self.externalUrl = externalUrl
        self.thumbUrl = thumbUrl
        self.title = title
        self.duration = duration
        self.description = description
        self.hashtags = hashtags
        self.products = products
        self.styles = styles
        self.isLiked = isLiked
        self.isSaved = isSaved
        self.likesCount = likesCount
    }
}

extension VideoPost: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
    static func == (lhs: VideoPost, rhs: VideoPost) -> Bool {
        return lhs.id == rhs.id
            && lhs.createdBy == rhs.createdBy
            && lhs.description == rhs.description
            && lhs.title == rhs.title
    }
}

extension VideoPost: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return self.hashValue as NSNumber
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let other = object as? VideoPost else { return false }
        return self == other
    }
}


class YoutubeVideoData : Codable {
    let videoId: String?
    let thumbnail: String?
    let title: String?
    let description: String?
    let duration: String?
    
    init(videoId: String?, thumbnail: String?, title: String?, description: String?, duration: String?) {
        self.videoId = videoId
        self.thumbnail = thumbnail
        self.title = title
        self.description = description
        self.duration = duration
    }
    
}
