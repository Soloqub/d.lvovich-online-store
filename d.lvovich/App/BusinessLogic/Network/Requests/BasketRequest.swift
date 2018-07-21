//
//  BasketRequest.swift
//  d.lvovich
//
//  Created by Денис Львович on 21.07.2018.
//  Copyright © 2018 Денис Львович. All rights reserved.
//

import Alamofire

class BasketRequest: AbstractRequestFactory {
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

extension BasketRequest: BasketRequestFactory {

    func addProductToBasket(withProductID productID: Int, andQuantity quantity: Int,
                            completionHandler: @escaping (DataResponse<RequestResult>) -> Void) {
        let requestModel = AddProductToBasketRequest(productID: productID, quantity: quantity)
        self.request(request: requestModel, completionHandler: completionHandler)
    }

    func deleteProductFromBasket(withProductID productID: Int, completionHandler: @escaping (DataResponse<RequestResult>) -> Void) {
        let requestModel = DeleteProductFromBasketRequest(productID: productID)
        self.request(request: requestModel, completionHandler: completionHandler)
    }

    func basketPay(forUser id: Int, completionHandler: @escaping (DataResponse<RequestResult>) -> Void) {
        let requestModel = BasketPayRequest(userID: id)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension BasketRequest {

    struct AddProductToBasketRequest: RequestRouter {
        let path: String = "addToBasket"
        let baseUrl: URL = BaseConfig.baseURL
        let method: HTTPMethod = .post
        let productID: Int
        let quantity: Int

        var parameters: Parameters? {
            return [
                "id_product": productID,
                "quantity": quantity
            ]
        }
    }

    struct DeleteProductFromBasketRequest: RequestRouter {
        let path: String = "deleteFromBasket"
        let baseUrl: URL = BaseConfig.baseURL
        let method: HTTPMethod = .post
        let productID: Int

        var parameters: Parameters? {
            return [
                "id_product": productID
            ]
        }
    }

    struct BasketPayRequest: RequestRouter {
        let path: String = "basketPay"
        let baseUrl: URL = BaseConfig.baseURL
        let method: HTTPMethod = .post
        let userID: Int

        var parameters: Parameters? {
            return [
                "id_user": userID
            ]
        }
    }
}
