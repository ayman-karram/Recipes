//
//  ConfigurationManager.swift
//  Recipes
//
//  Created by Ayman Karram on 25.12.19.
//  Copyright © 2019 Ayman Karram. All rights reserved.
//

import Foundation

enum ConfigurationKeys: String, CaseIterable {
    case contentfulSpaceID = "Contentful space id"
    case contentfulAccessToken = "Contentful access token"
}

class ConfigurationManager {

    static func infoForKey(_ key: ConfigurationKeys) -> String? {
        return (Bundle.main.infoDictionary?[key.rawValue] as? String)
     }
}
