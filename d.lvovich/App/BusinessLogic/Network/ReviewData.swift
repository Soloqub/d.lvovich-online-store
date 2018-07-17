//
//  ReviewData.swift
//  d.lvovich
//
//  Created by Денис on 17.07.2018.
//  Copyright © 2018 Денис Львович. All rights reserved.
//

import Alamofire

class ReviewData: AbstractRequestFactory {
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

extension ReviewData: ReviewRequestFactory {
    func getReviewsList(byID productID: Int, completionHandler: @escaping (DataResponse<[Product]>) -> Void) {
        
        let requestModel = ReviewListRequest(productID: 12)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func addProductReview(byID productID: Int, completionHandler: @escaping (DataResponse<ProductDetail>) -> Void) {
        let requestModel = AddProductReviewRequest(productID: productID)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func deleteProductReview(withID id: Int, byProductID productID: Int, completionHandler: @escaping (DataResponse<ProductDetail>) -> Void) {
        let requestModel = DeleteProductReviewRequest(productID: 12, id: 1)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension ReviewData {
    
    struct ReviewListRequest: RequestRouter {
        let path: String = "getReviews"
        let baseUrl: URL = BaseConfig.baseURL
        let method: HTTPMethod = .get
        let productID: Int
        
        var parameters: Parameters? {
            return [
                "id_product": productID
            ]
        }
    }
    
    struct AddProductReviewRequest: RequestRouter {
        let path: String = "addReview"
        let baseUrl: URL = BaseConfig.baseURL
        let method: HTTPMethod = .post
        let productID: Int
        
        var parameters: Parameters? {
            return [
                "id_product": productID
            ]
        }
    }
    
    struct DeleteProductReviewRequest: RequestRouter {
        let path: String = "addReview"
        let baseUrl: URL = BaseConfig.baseURL
        let method: HTTPMethod = .post
        let productID: Int
        let id: Int
        
        var parameters: Parameters? {
            return [
                "id_product": productID,
                "id_review": id
            ]
        }
    }
}
