//
//  RecipesServiceProtocol.swift
//  Recipes
//
//  Created by Ayman Karram on 25.12.19.
//  Copyright © 2019 Ayman Karram. All rights reserved.
//

import Foundation

typealias FetchRecipesResult = RecipesResult<[Recipe], Error>
typealias FetchRecipesCompletion = (_ result: FetchRecipesResult) -> Void

/// Recipes service protocol to define the functions defination for recipies API
protocol RecipesServiceProtocol {
    /**
    Fetching all recipies

    Calling this method to fetch all recipies

    - Parameter completion: result of type RecipesResult with two cases .success(array of Recipes) or .failure(error).
    */
    func fetchAllRecipies(completion: @escaping FetchRecipesCompletion)
}
