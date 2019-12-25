//
//  RecipesViewModel.swift
//  Recipes
//
//  Created by Ayman Karram on 25.12.19.
//  Copyright © 2019 Ayman Karram. All rights reserved.
//

import Foundation

enum ListViewModelState {
    case loading
    case finishedLoading
    case error(Error?)
}

class RecipesViewModel {

    private (set) var state: ListViewModelState = .loading
    private (set) var recipesCellsViewModels: [RecipeTableCellViewModel] = []
    private var recipesArray :[Recipe] = []

    /**
    Fetching all recipes

    Calling this method to fetch all recipes with dependency injection of network server client object  to be able to mock the network layer for unit testing

    - Parameter networkServerClient: Network server client refrence.
    */
    func fetchRecipes(networkServerClient: NetworkServerClient = NetworkServerClient()) {
        state = .loading
        networkServerClient.fetchAllRecipes(completion: { [weak self] result in
            self?.state = .finishedLoading
            switch result {
            case .success(let recipes):
                self?.recipesArray = recipes
                self?.recipesCellsViewModels = recipes.compactMap { RecipeTableCellViewModel(recipe: $0)}
            case .failure(let error):
                self?.state = .error(error)
                break
            }
        })
    }
}
