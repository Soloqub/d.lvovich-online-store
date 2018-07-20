//
//  ProductsData.swift
//  d.lvovich
//
//  Created by Денис on 10.07.2018.
//  Copyright © 2018 Денис Львович. All rights reserved.
//

import Alamofire

class ProductData: AbstractRequestFactory {
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

extension ProductData: ProductRequestFactory {
    func getProductsList(completionHandler: @escaping (DataResponse<[Product]>) -> Void) {
        let requestModel = ProductListRequest()
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func getProduct(byID productID: Int, completionHandler: @escaping (DataResponse<ProductDetail>) -> Void) {
        let requestModel = ProductRequest(id: 12)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension ProductData {
    
    struct ProductListRequest: RequestRouter {
        let path: String = "getProducts"
        let baseUrl: URL = BaseConfig.baseURL
        let method: HTTPMethod = .get
        
        var parameters: Parameters?
    }
    
    struct ProductRequest: RequestRouter {
        let path: String = "getProductByID"
        let baseUrl: URL = BaseConfig.baseURL
        let method: HTTPMethod = .get
        let id: Int
        
        var parameters: Parameters? {
            return [
                "id_user": id
            ]
        }
    }
}
