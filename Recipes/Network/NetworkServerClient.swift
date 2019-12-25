//
//  NetworkServerClient.swift
//  Recipes
//
//  Created by Ayman Karram on 25.12.19.
//  Copyright © 2019 Ayman Karram. All rights reserved.
//

import Foundation
import Contentful

class NetworkServerClient {

   private let client = Client(spaceId: ConfigurationManager.infoForKey(.contentfulSpaceID) ?? "",
                        accessToken: ConfigurationManager.infoForKey(.contentfulAccessToken) ?? "",
                        contentTypeClasses: [Recipe.self, Chef.self])

}

//MARK: - Recipes
extension NetworkServerClient: RecipesServiceProtocol {
    func fetchAllRecipes(completion: @escaping(FetchRecipesResult) -> Void) {
        let query = QueryOn<Recipe>.where(contentTypeId: Recipe.contentTypeId)
        client.fetchArray(of: Recipe.self, matching: query) { (result: Result<HomogeneousArrayResponse<Recipe>>) in
            switch result {
            case .success(let allRecipesArray):
                completion(.success(payload: allRecipesArray.items))
            case .error(let error):
                completion(.failure(error))
            }
        }
    }
}
