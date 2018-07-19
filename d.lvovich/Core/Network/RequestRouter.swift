//
//  RequestRouter.swift
//  d.lvovich
//
//  Created by Денис on 05.07.2018.
//  Copyright © 2018 Денис Львович. All rights reserved.
//

import Alamofire

enum RequestRouterEncoding {
    case url, json
}

/// Протокол, определяет структуру стандартного запроса
protocol RequestRouter: URLRequestConvertible {
    
    var baseUrl: URL { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
    var fullUrl: URL { get }
    var encoding: RequestRouterEncoding { get }
}

extension RequestRouter {
    
    var fullUrl: URL {
        return baseUrl.appendingPathComponent(path)
    }
    
    var encoding: RequestRouterEncoding {
        if method == .get { return .url } else { return .json }
    }
    
    func asURLRequest() throws -> URLRequest {

        var urlRequest = URLRequest(url: fullUrl)
        urlRequest.httpMethod = method.rawValue
        switch self.encoding {
        case .url:
            print("URL ", try? URLEncoding.default.encode(urlRequest, with: parameters))
            return try URLEncoding.default.encode(urlRequest, with: parameters)
        case .json:
            print("JSON ", try? JSONEncoding.default.encode(urlRequest, with: parameters))
            return try JSONEncoding.default.encode(urlRequest, with: parameters)
        }
    }
}
