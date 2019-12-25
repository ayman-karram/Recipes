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

    //MARK:- Variables
    private (set) var state: Bindable<ListViewModelState> = Bindable(.loading)
    private (set) var recipesCellsViewModels: Bindable<[RecipeTableCellViewModel]> = Bindable([])
    private var recipesArray :[Recipe] = []
    private let networkServerClient: NetworkServerClient

    /// init RecipesViewModel with dependency injection of network server client object  to be able to mock the network layer for unit testing
    init(networkServerClient: NetworkServerClient = NetworkServerClient()) {
        self.networkServerClient = networkServerClient
    }

    //MARK:- Methods
    /**
    Fetching all recipes
     
    Calling this method to fetch all recipes
    */
    func fetchRecipes() {
        state.value = .loading
        networkServerClient.fetchAllRecipes(completion: { [weak self] result in
            self?.state.value = .finishedLoading
            switch result {
            case .success(let recipes):
                self?.recipesArray = recipes
                self?.recipesCellsViewModels.value = recipes.compactMap { RecipeTableCellViewModel(recipe: $0)}
            case .failure(let error):
                self?.state.value = .error(error)
                break
            }
        })
    }
}
