//
//  AppDelegate.swift
//  Recipes
//
//  Created by Ayman Karram on 25.12.19.
//  Copyright © 2019 Ayman Karram. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var recipesListCoordinator: RecipesListCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        recipesListCoordinator = RecipesListCoordinator(navigationController: UINavigationController())
        recipesListCoordinator?.show()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = recipesListCoordinator?.navigationController
        window?.makeKeyAndVisible()

        return true
    }
}

