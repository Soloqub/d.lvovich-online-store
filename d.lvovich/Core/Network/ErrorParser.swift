//
//  ErrorParser.swift
//  d.lvovich
//
//  Created by Денис on 05.07.2018.
//  Copyright © 2018 Денис Львович. All rights reserved.
//

import UIKit

class ErrorParser: AbstractErrorParser {
    
    func parse(_ result: Error) -> Error {
        return result
    }
    
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        return error
    }
}
