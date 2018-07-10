//
//  ProfileRequestFactory.swift
//  d.lvovich
//
//  Created by Денис Львович on 10.07.2018.
//  Copyright © 2018 Денис Львович. All rights reserved.
//

import Alamofire

protocol ProfileRequestFactory {
    func sendProfile(userProfile: UserProfile,
                     completionHandler: @escaping (DataResponse<RequestResult>) -> Void)
    func register(userProfile: UserProfile,
                  completionHandler: @escaping (DataResponse<RegResult>) -> Void)
}
