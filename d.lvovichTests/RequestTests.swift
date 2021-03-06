//
//  RequestTests.swift
//  d.lvovichTests
//
//  Created by Денис on 10.07.2018.
//  Copyright © 2018 Денис Львович. All rights reserved.
//

@testable import d_lvovich
import XCTest

class RequestTests: XCTestCase {
    
    var requestFactory: RequestFactory?
    let expectation = XCTestExpectation(description: "")
    
    override func setUp() {
        super.setUp()
        requestFactory = RequestFactory()
    }
    
    override func tearDown() {
        super.tearDown()
        requestFactory = nil
    }

    // MARK: - Auth tests
    
    func testLogin() {
        
        let auth = requestFactory?.makeAuthRequestFactory()
        auth?.login(userName: "Ivan", password: "Xxxxxxx") { response in
            
            let result = response.result.value?.result
            XCTAssertEqual(result, 1)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
    
    func testLogout() {
        
        let auth = requestFactory?.makeAuthRequestFactory()
        auth?.logout(userID: 12) { response in
            
            let result = response.result.value?.result
            XCTAssertEqual(result, 1)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }

    // MARK: - Products tests
    
    func testProductList() {
        
        let getProduct = requestFactory?.productRequestFactory()
        getProduct?.getProductsList { response in
            
            let result = response.result.value
            XCTAssert(result != nil)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
    
    func testProductByID() {
        
        let getProduct = requestFactory?.productRequestFactory()
        getProduct?.getProduct(byID: 1) { response in
            
            let result = response.result.value?.result
            XCTAssertEqual(result, 1)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }

    // MARK: - Register and profile update tests

    func testRegister() {

        let reg = requestFactory?.changeProfileRequestFactory()
        let profile = UserProfile(id: 12, login: "Username", password: "pass123", email: "123@mail.ru", gender: "m", creditCard: "123-1234-32134", bio: "No bio")
        reg?.register(userProfile: profile) { response in

            let result = response.result.value?.result
            XCTAssertEqual(result, 1)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }

    func testProfileUpdate() {

        let update = requestFactory?.changeProfileRequestFactory()
        let profile = UserProfile(id: 12, login: "Username", password: "pass123", email: "123@mail.ru", gender: "m", creditCard: "123-1234-32134", bio: "No bio")
        update?.sendProfile(userProfile: profile) { response in

            let result = response.result.value?.result
            XCTAssertEqual(result, 1)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }

    // MARK: - Review tests
    
    func testReviewList() {
        
        let getReviews = requestFactory?.reviewRequestFactory()
        getReviews?.getReviewsList(byID: 12) { response in
            
            let result = response.result.value
            XCTAssert(result != nil)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
    
    func testAddReview() {
        
        let addReview = requestFactory?.reviewRequestFactory()
        addReview?.addProductReview(byID: 12) { response in
            
            let result = response.result.value
            XCTAssert(result != nil)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
    
    func testDeleteReview() {
        
        let deleteReview = requestFactory?.reviewRequestFactory()
        deleteReview?.deleteProductReview(withID: 1, byProductID: 12) { response in
            
            let result = response.result.value
            XCTAssert(result != nil)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }

    // MARK: - Basket tests

    func testAddToBasket() {

        let basket = requestFactory?.basketRequestFactory()
        basket?.addProductToBasket(withProductID: 12, andQuantity: 1) { response in

            let result = response.result.value?.result
            XCTAssertEqual(result, 1)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }

    func testDeleteFromBasket() {

        let basket = requestFactory?.basketRequestFactory()
        basket?.deleteProductFromBasket(withProductID: 12) { response in

            let result = response.result.value?.result
            XCTAssertEqual(result, 1)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }

    func testBasketPay() {

        let basket = requestFactory?.basketRequestFactory()
        basket?.basketPay(forUser: 22) { response in

            let result = response.result.value?.result
            XCTAssertEqual(result, 1)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
}
