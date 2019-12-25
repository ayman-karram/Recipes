//
//  Result.swift
//  Recipes
//
//  Created by Ayman Karram on 25.12.19.
//  Copyright © 2019 Ayman Karram. All rights reserved.
//

import Foundation

enum RecipesResult<T, U: Error> {
    case success(payload: T)
    case failure(U?)
}
