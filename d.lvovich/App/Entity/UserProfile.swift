//
//  UserProfile.swift
//  d.lvovich
//
//  Created by Денис on 06.07.2018.
//  Copyright © 2018 Денис Львович. All rights reserved.
//

import Foundation

struct UserProfile: Codable {
    let id: Int
    let login: String
    let password: String
    let email: String
    let gender: String
    let creditCard: String
    let bio: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id_user"
        case login = "username"
        case password
        case email
        case gender
        case creditCard = "credit_card"
        case bio
    }
}
