//
//  AuthRequestFactory.swift
//  d.lvovich
//
//  Created by Денис Львович on 05.07.2018.
//  Copyright © 2018 Денис Львович. All rights reserved.
//

import Alamofire

protocol AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping
        (DataResponse<LoginResult>) -> Void)
}
