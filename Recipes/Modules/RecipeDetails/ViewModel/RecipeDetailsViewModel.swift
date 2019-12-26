//
//  RecipeDetailsViewModel.swift
//  Recipes
//
//  Created by Ayman Karram on 26.12.19.
//  Copyright © 2019 Ayman Karram. All rights reserved.
//

import Foundation

class RecipeDetailsViewModel {

    var title: String = ""
    var tags: String = ""
    var chefName: String = ""
    var imageURL: URL?
    var description: String = ""

    init(recipe: Recipe?) {
        guard let recipe = recipe else {return}
        title = recipe.title ?? ""
        chefName = recipe.chef?.name ?? ""
        description = recipe.description ?? ""
        imageURL = recipe.photo?.url
        if let tags = recipe.tags {
            for tag in tags {
                self.tags += (tag.name ?? "").capitalized + " "
            }
        }
    }
}
