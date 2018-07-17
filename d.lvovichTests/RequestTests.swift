//
//  RequestTests.swift
//  d.lvovichTests
//
//  Created by Денис on 10.07.2018.
//  Copyright © 2018 Денис Львович. All rights reserved.
//

import XCTest
@testable import d_lvovich

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
    
    func testLogin() {
        
        let auth = requestFactory?.makeAuthRequestFactory()
        auth?.login(userName: "Ivan", password: "Xxxxxxx") { (response) in
            
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

    func testPrifileUpdate() {

        let update = requestFactory?.changeProfileRequestFactory()
        let profile = UserProfile(id: 12, login: "Username", password: "pass123", email: "123@mail.ru", gender: "m", creditCard: "123-1234-32134", bio: "No bio")
        update?.sendProfile(userProfile: profile) { response in

            let result = response.result.value?.result
            XCTAssertEqual(result, 1)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
}
