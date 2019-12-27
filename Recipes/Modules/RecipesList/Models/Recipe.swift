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
    var description: String?
    var chef: Chef?
    var photo: Asset?
    var tags: [Tag]?

    // To be used for mock model for unit test
    init(id: String, updatedAt: Date?, createdAt: Date?,
         localeCode: String?,
         chef: Chef?,
         photo: Asset?,
         title: String?,
         description: String,
         tags: [Tag]?) {
        self.id = id
        self.updatedAt = updatedAt
        self.createdAt = createdAt
        self.localeCode = localeCode
        self.chef = chef
        self.photo = photo
        self.title = title
        self.description = description
        self.tags = tags
    }

    required init(from decoder: Decoder) throws {
        let sys         = try decoder.sys()
        id              = sys.id
        localeCode      = sys.locale
        updatedAt       = sys.updatedAt
        createdAt       = sys.createdAt
        let fields      = try decoder.contentfulFieldsContainer(keyedBy: Recipe.FieldKeys.self)
        title = try fields.decodeIfPresent(String.self, forKey: .title)
        description = try fields.decodeIfPresent(String.self, forKey: .description)
        try fields.resolveLink(forKey: .photo, decoder: decoder) { [weak self] image in
            self?.photo = image as? Asset
        }
        try fields.resolveLink(forKey: .chef, decoder: decoder) { [weak self] chef in
            self?.chef = chef as? Chef
        }
        try fields.resolveLinksArray(forKey: .tags, decoder: decoder) { [weak self] tags in
            self?.tags = tags as? [Tag]
        }
    }

    enum FieldKeys: String, CodingKey {
        case title, photo, description, tags, chef
    }
}

extension Recipe {
    static func mockRecipe() -> Recipe {
        return Recipe(id: "1", updatedAt: Date(), createdAt: Date(),
                      localeCode: "",
                      chef: Chef.mockChef(),
                      photo: nil,
                      title: "Soup",
                      description: "Vegan Soup",
                      tags: [Tag.mockTagWith(id: "1", name: "Vegan"),
                             Tag.mockTagWith(id: "2", name: "Healthy")])
    }
}
