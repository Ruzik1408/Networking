//
//  PaginationResult.swift
//  catchesapp
//
//  Created by Ruzanna Ghazaryan on 9/7/18.
//  Copyright © 2018 Catches Limited. All rights reserved.
//

import Foundation

class PaginationResult <T : Codable> : Codable {
    let count: Int?
    let page: Int?
    let pageSize: Int?
    let totalCount: Int?
    let data : [T]

    init(count: Int?, page: Int?, pageSize: Int?,totalCount: Int?,data : [T]) {
        self.count = count
        self.page = page
        self.pageSize = pageSize
        self.totalCount = totalCount
        self.data = data
    }
}
