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
    let baseUrl = BaseConfig.baseURL
    init(
        errorParser: AbstractErrorParser,
        sessionManager: SessionManager,
        queue: DispatchQueue? = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension ProfileData: ProfileRequestFactory {
    
    func sendProfile(userProfile: UserProfile,
                     completionHandler: @escaping (DataResponse<RequestResult>) -> Void) {
        let requestModel = Profile(baseUrl: baseUrl,
                                   requestType: .mod,
                                   id: userProfile.id,
                                   login: userProfile.login,
                                   password: userProfile.password,
                                   email: userProfile.email,
                                   gender: userProfile.gender,
                                   creditCard: userProfile.creditCard,
                                   bio: userProfile.bio)
        self.request(request: requestModel, completionHandler: completionHandler)
    }

    func register(userProfile: UserProfile,
                  completionHandler: @escaping (DataResponse<RegResult>) -> Void) {
        let requestModel = Profile(baseUrl: baseUrl,
                                   requestType: .reg,
                                   id: userProfile.id,
                                   login: userProfile.login,
                                   password: userProfile.password,
                                   email: userProfile.email,
                                   gender: userProfile.gender,
                                   creditCard: userProfile.creditCard,
                                   bio: userProfile.bio)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension ProfileData {
    struct Profile: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let requestType: RequestType
        let id: Int
        let login: String
        let password: String
        let email: String
        let gender: String
        let creditCard: String
        let bio: String
        
        enum RequestType {
            case reg, mod
        }
        
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
        
        var path: String {
            switch requestType {
            case .reg:
                return "registerUser.json"
            case .mod:
                return "changeUserData.json"
            }
        }
    }
}
