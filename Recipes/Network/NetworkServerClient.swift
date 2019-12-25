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

    let client = Client(spaceId: ConfigurationManager.infoForKey(.contentfulSpaceID) ?? "",
                        accessToken: ConfigurationManager.infoForKey(.contentfulAccessToken) ?? "")

    
}
