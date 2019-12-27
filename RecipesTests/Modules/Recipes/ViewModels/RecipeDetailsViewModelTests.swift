//
//  RecipeDetailsViewModelTests.swift
//  RecipesTests
//
//  Created by Ayman Karram on 28.12.19.
//  Copyright © 2019 Ayman Karram. All rights reserved.
//

import XCTest
@testable import Recipes

class RecipeDetailsViewModelTests: XCTestCase {

    func testBindViewModel () {
        let recipe = Recipe.mockRecipe()
        let viewModel = RecipeDetailsViewModel(recipe: recipe)
        XCTAssertNotNil(viewModel)
        XCTAssertEqual(viewModel.chefName, recipe.chef?.name)
        var tagsString = ""
        if let tags = recipe.tags {
            for tag in tags {
                tagsString += (tag.name ?? "").capitalized + " "
            }
        }
        XCTAssertEqual(viewModel.tags, tagsString)
        XCTAssertEqual(viewModel.description, recipe.description)
    }

}
