//
//  BasketRequestFactory.swift
//  d.lvovich
//
//  Created by Денис Львович on 21.07.2018.
//  Copyright © 2018 Денис Львович. All rights reserved.
//

import Alamofire

protocol BasketRequestFactory {

    func addProductToBasket(withProductID productID: Int, andQuantity quantity: Int,
                            completionHandler: @escaping (DataResponse<RequestResult>) -> Void)
    func deleteProductFromBasket(withProductID productID: Int, completionHandler: @escaping (DataResponse<RequestResult>) -> Void)
    func basketPay(forUser id: Int, completionHandler: @escaping (DataResponse<RequestResult>) -> Void)
}
