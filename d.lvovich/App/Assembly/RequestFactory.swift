//
//  RequestFactory.swift
//  d.lvovich
//
//  Created by Денис Львович on 05.07.2018.
//  Copyright © 2018 Денис Львович. All rights reserved.
//

import Alamofire

class RequestFactory {

    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }

    lazy var commonSessionManager: SessionManager = {
        
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        let manager = SessionManager(configuration: configuration)
        return manager
    }()

    let sessionQueue = DispatchQueue.global(qos: .utility)

    func makeAuthRequestFactory() -> AuthRequestFactory {

        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser, sessionManager: commonSessionManager,
                    queue: sessionQueue)
    }
}