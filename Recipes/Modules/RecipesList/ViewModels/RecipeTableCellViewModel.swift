//
//  RecipeTableCellViewModel.swift
//  Recipes
//
//  Created by Ayman Karram on 25.12.19.
//  Copyright © 2019 Ayman Karram. All rights reserved.
//

import Foundation

class RecipeTableCellViewModel {

    static let identifier = String(describing: RecipeTableViewCell.self)
    private (set) var title: String?
    private (set) var imageURL: URL?

    init(recipe: Recipe?) {
        guard let recipe = recipe else {return}
        title = recipe.title
        imageURL = recipe.photo?.url
    }
}
