//
//  ConfigurationManager.swift
//  RecipesTests
//
//  Created by Ayman Karram on 25.12.19.
//  Copyright © 2019 Ayman Karram. All rights reserved.
//

import XCTest
@testable import Recipes

class ConfigurationManagerTests: XCTestCase {

    func testInfoForKey() {
        for key in ConfigurationKeys.allCases {
            let value = ConfigurationManager.infoForKey(key)
            XCTAssertNotNil(value)
        }
    }
}
