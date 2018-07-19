//
//  ReviewRequestFactory.swift
//  d.lvovich
//
//  Created by Денис on 17.07.2018.
//  Copyright © 2018 Денис Львович. All rights reserved.
//

import Alamofire

protocol ReviewRequestFactory {
    func getReviewsList(byID productID: Int,
                        completionHandler: @escaping (DataResponse<[Product]>) -> Void)
    func addProductReview(byID productID: Int,
                          completionHandler: @escaping (DataResponse<ProductDetail>) -> Void)
    func deleteProductReview(withID id: Int, byProductID productID: Int,
                             completionHandler: @escaping (DataResponse<ProductDetail>) -> Void)
}
