//
//  EntryDecodableWithName.swift
//  Recipes
//
//  Created by Ayman Karram on 27.12.19.
//  Copyright © 2019 Ayman Karram. All rights reserved.
//

import Foundation
import Contentful

class EntryDecodableWithName: FieldKeysQueryable {
    var id: String
    var updatedAt: Date?
    var createdAt: Date?
    var localeCode: String?
    //Fields
    var name: String?

    internal init(id: String,
                  updatedAt: Date?,
                  createdAt: Date?,
                  localeCode: String?,
                  name: String?) {
        self.id = id
        self.updatedAt = updatedAt
        self.createdAt = createdAt
        self.localeCode = localeCode
        self.name = name
    }

    public required init(from decoder: Decoder) throws {
        let sys         = try decoder.sys()
        id              = sys.id
        localeCode      = sys.locale
        updatedAt       = sys.updatedAt
        createdAt       = sys.createdAt
        let fields      = try decoder.contentfulFieldsContainer(keyedBy: Chef.FieldKeys.self)
        name = try fields.decodeIfPresent(String.self, forKey: .name)
    }

    enum FieldKeys: String, CodingKey {
      case name
    }
}
