//
//  Chef.swift
//  Recipes
//
//  Created by Ayman Karram on 25.12.19.
//  Copyright © 2019 Ayman Karram. All rights reserved.
//

import Foundation
import Contentful

class Chef: EntryDecodableWithName, EntryDecodable {
    static var contentTypeId: ContentTypeId = "chef"
}

extension Chef {
    static func mockChef() -> Chef {
        return Chef(id: "1", updatedAt: Date(), createdAt: Date(), localeCode: "", name: "Mock Chef")
    }
}
