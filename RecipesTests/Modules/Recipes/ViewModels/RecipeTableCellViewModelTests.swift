//
//  RecipeTableCellViewModelTests.swift
//  RecipesTests
//
//  Created by Ayman Karram on 25.12.19.
//  Copyright © 2019 Ayman Karram. All rights reserved.
//

import XCTest
@testable import Recipes

class RecipeTableCellViewModelTests: XCTestCase {

    func testInit() {
        let viewModel = RecipeTableCellViewModel(recipe: Recipe.mockRecipe())
        XCTAssertNotNil(viewModel)
        XCTAssertEqual(viewModel.title, viewModel.title)
    }
}
