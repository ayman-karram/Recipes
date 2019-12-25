//
//  RecipesServiceProtocol.swift
//  Recipes
//
//  Created by Ayman Karram on 25.12.19.
//  Copyright © 2019 Ayman Karram. All rights reserved.
//

import Foundation

typealias FetchRecipesResult = RecipesResult<[Recipe], Error>
typealias FetchRecipesCompletion = ((_ result: FetchRecipesResult) -> Void)

/// Recipes service protocol to define the functions defination for recipes API
protocol RecipesServiceProtocol {
    /**
    Fetching all recipes

    Calling this method to fetch all recipes

    - Parameter completion: result of type RecipesResult with two cases .success(array of Recipes) or .failure(error).
    */
    func fetchAllRecipes(completion: @escaping FetchRecipesCompletion)
}
