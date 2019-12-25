//
//  RecipesViewModelTests.swift
//  RecipesTests
//
//  Created by Ayman Karram on 25.12.19.
//  Copyright © 2019 Ayman Karram. All rights reserved.
//

import XCTest
@testable import Recipes

class RecipesViewModelTests: XCTestCase {

    func testSuccessFetchRecipes() {
        let networkServer = MockNetworkServerClient()
        networkServer.allRecipesResult = .success(payload: [Recipe.mockRecipe()])
        let viewModel = RecipesViewModel(networkServerClient: networkServer)
        viewModel.fetchRecipes()
        guard Recipe.mockRecipe().title == viewModel.recipesCellsViewModels.value.first?.title else {
            XCTFail()
            return
        }
        guard case ListViewModelState.finishedLoading = viewModel.state.value else {
            XCTFail()
            return
        }
    }

    func testFailFetchRecipes() {
        let networkServer = MockNetworkServerClient()
        networkServer.allRecipesResult = .failure(nil)
        let viewModel = RecipesViewModel(networkServerClient: networkServer)
        viewModel.fetchRecipes()
        guard viewModel.recipesCellsViewModels.value.isEmpty else {
            XCTFail()
            return
        }
        guard case ListViewModelState.error(_) = viewModel.state.value else {
            XCTFail()
            return
        }
    }
}

private class MockNetworkServerClient: NetworkServerClient {

    var allRecipesResult : FetchRecipesResult =  .success(payload: [])

    override init() {
        super.init()
    }

    override func fetchAllRecipes(completion: @escaping FetchRecipesCompletion) {
            completion(allRecipesResult)
    }
}
