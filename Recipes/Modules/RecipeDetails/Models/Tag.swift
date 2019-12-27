//
//  Tag.swift
//  Recipes
//
//  Created by Ayman Karram on 26.12.19.
//  Copyright © 2019 Ayman Karram. All rights reserved.
//

import Foundation
import Contentful

class Tag: EntryDecodableWithName, EntryDecodable {
    static var contentTypeId: ContentTypeId = "tag"
}

extension Tag {
    static func mockTagWith(id: String, name: String) -> Tag {
        return Tag(id: id, updatedAt: Date(), createdAt: Date(), localeCode: "", name: name)
    }
}
