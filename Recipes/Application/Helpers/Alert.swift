//
//  Alert.swift
//  Recipes
//
//  Created by Ayman Karram on 26.12.19.
//  Copyright © 2019 Ayman Karram. All rights reserved.
//

import Foundation

struct AlertAction {
    let buttonTitle: String
    let handler: (() -> Void)?
}

struct SingleButtonAlert {
    let title: String
    let message: String?
    let action: AlertAction
}
