//
//  ProfileData.swift
//  d.lvovich
//
//  Created by Денис on 06.07.2018.
//  Copyright © 2018 Денис Львович. All rights reserved.
//

import Alamofire

class ProfileData: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: SessionManager
    let queue: DispatchQueue?
    let baseUrl = URL(string:
        "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    init(
        errorParser: AbstractErrorParser,
        sessionManager: SessionManager,
        queue: DispatchQueue? = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension ProfileData {
    func sendProfile(id: Int,
                     login: String,
                     password: String,
                     email: String,
                     gender: String,
                     creditCard: String, bio: String,
                     completionHandler: @escaping (DataResponse<RequestResult>) -> Void) {
        let requestModel = Profile(baseUrl: baseUrl,
                                   id: id,
                                   login: login,
                                   password: password,
                                   email: email,
                                   gender: gender,
                                   creditCard: creditCard,
                                   bio: bio)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension ProfileData {
    struct Profile: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "changeUserData.json"
        let id: Int
        let login: String
        let password: String
        let email: String
        let gender: String
        let creditCard: String
        let bio: String
        
        var parameters: Parameters? {
            return [
                "id_user": id,
                "username": login,
                "password": password,
                "email": email,
                "gender": gender,
                "credit_card": creditCard,
                "bio": bio
            ]
        }
    }
}
