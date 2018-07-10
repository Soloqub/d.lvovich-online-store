//
//  ResponseCodableTests.swift
//  d.lvovichTests
//
//  Created by Денис on 10.07.2018.
//  Copyright © 2018 Денис Львович. All rights reserved.
//

import Alamofire
import XCTest
@testable import d_lvovich

class ResponseCodableTests: XCTestCase {
    
    let expectation = XCTestExpectation(description: "")
    var errorParser: ErrorParserStab?
    
    struct PostStub: Codable {
        let userId: Int
        let id: Int
        let title: String
        let body: String
    }
    
    
    enum ApiErrorStab: Error {
        case fatalError
    }
    
    
    struct ErrorParserStab: AbstractErrorParser {
        func parse(_ result: Error) -> Error {
            return ApiErrorStab.fatalError
        }
        
        func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
            return error
        }
    }
    
    override func setUp() {
        super.setUp()
        errorParser = ErrorParserStab()
    }
    
    override func tearDown() {
        super.tearDown()
        errorParser = nil
    }
    
    func testShouldDownloadAndParse() {
        
        Alamofire
            .request("https://jsonplaceholder.typicode.com/posts/1")
            .responseCodable(errorParser: errorParser!) { (response: DataResponse<PostStub>) -> (Void) in
                switch response.result {
                case .success:
                    break
                case .failure:
                    XCTFail()
                }
                self.expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
}
