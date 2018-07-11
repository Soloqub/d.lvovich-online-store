//
//  BaseConfig.swift
//  d.lvovich
//
//  Created by Денис on 09.07.2018.
//  Copyright © 2018 Денис Львович. All rights reserved.
//

import UIKit

struct BaseConfig {
    
    private init() { }
    
    // swiftlint:disable force_unwrapping
    static let baseURL = URL(string:
    "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    // swiftlint:enable force_unwrapping
}
