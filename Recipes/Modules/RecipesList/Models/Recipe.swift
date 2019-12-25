//
//  Recipe.swift
//  Recipes
//
//  Created by Ayman Karram on 25.12.19.
//  Copyright © 2019 Ayman Karram. All rights reserved.
//

import Foundation
import Contentful

class Recipe: EntryDecodable, FieldKeysQueryable {

    static var contentTypeId: ContentTypeId = "recipe"
    var id: String
    var updatedAt: Date?
    var createdAt: Date?
    var localeCode: String?
    //Fields
    var title: String?
    var chef: Chef?
    var photo: Asset?

    init(id: String, updatedAt: Date?, createdAt: Date?, localeCode: String?, chef: Chef?, photo: Asset?, title: String?) {
        self.id = id
        self.updatedAt = updatedAt
        self.createdAt = createdAt
        self.localeCode = localeCode
        self.chef = chef
        self.photo = photo
        self.title = title
    }

    required init(from decoder: Decoder) throws {
        let sys         = try decoder.sys()
        id              = sys.id
        localeCode      = sys.locale
        updatedAt       = sys.updatedAt
        createdAt       = sys.createdAt
        let fields      = try decoder.contentfulFieldsContainer(keyedBy: Recipe.FieldKeys.self)
        title = try fields.decodeIfPresent(String.self, forKey: .title)
        try fields.resolveLink(forKey: .photo, decoder: decoder) { [weak self] image in
            self?.photo = image as? Asset
        }
        try fields.resolveLink(forKey: .chef, decoder: decoder) { [weak self] chef in
            self?.chef = chef as? Chef
        }
    }

    enum FieldKeys: String, CodingKey {
        case title, photo
        case chef = "chef"
    }
}

