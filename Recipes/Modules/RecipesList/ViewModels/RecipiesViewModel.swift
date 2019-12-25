//
//  RecipiesViewModel.swift
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

class RecipiesViewModel {

    private (set) var state: ListViewModelState = .loading
    private (set) var recipiesCellsViewModels: [RecipeTableCellViewModel] = []
    private var recipiesArray :[Recipe] = []

    func fetchRecipies(networkServerClient: NetworkServerClient = NetworkServerClient()) {
        state = .loading
        networkServerClient.fetchAllRecipies(completion: { [weak self] result in
            self?.state = .finishedLoading
            switch result {
            case .success(let recipies):
                self?.recipiesArray = recipies
                self?.recipiesCellsViewModels = recipies.compactMap { RecipeTableCellViewModel(recipe: $0)}
            case .failure(let error):
                self?.state = .error(error)
                break
            }
        })
    }
}
