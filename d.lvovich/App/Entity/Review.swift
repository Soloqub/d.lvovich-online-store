//
//  Review.swift
//  d.lvovich
//
//  Created by Денис on 17.07.2018.
//  Copyright © 2018 Денис Львович. All rights reserved.
//

import Foundation

struct ReviewResult: Codable {
    let result: Int
    let message: String
    let review: Review
}

struct Review: Codable {
    let id: Int
    let authorName: String
    let text: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case authorName = "author_name"
        case text
    }
}
