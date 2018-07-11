//
//  ProductRequestFactory.swift
//  d.lvovich
//
//  Created by Денис on 10.07.2018.
//  Copyright © 2018 Денис Львович. All rights reserved.
//

import Alamofire

protocol ProductRequestFactory {
    func getProductsList(completionHandler: @escaping (DataResponse<[Product]>) -> Void)
    func getProduct(byID productID: Int,
                    completionHandler: @escaping (DataResponse<ProductDetail>) -> Void)
}
