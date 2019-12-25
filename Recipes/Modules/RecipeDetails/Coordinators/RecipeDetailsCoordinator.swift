//
//  RecipeDetailsCoordinator.swift
//  Recipes
//
//  Created by Ayman Karram on 25.12.19.
//  Copyright © 2019 Ayman Karram. All rights reserved.
//

import UIKit

class RecipeDetailsCoordinator: Coordinator {

    //MARK:- Variables
    var navigationController: UINavigationController

    //MARK:- Init
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    //MARK:- Helpers
    func getViewController() -> UIViewController {
        return RecipeDetailsViewController()
    }

    func show(present: Bool = false) {
        let recipeDetailsViewController = RecipeDetailsViewController()
        if present {
            recipeDetailsViewController.modalTransitionStyle = .crossDissolve
            self.navigationController.viewControllers.last?.present(recipeDetailsViewController,
                                                                    animated: true, completion: nil)
        } else {
            self.navigationController.navigationBar.prefersLargeTitles = true
            self.navigationController.pushViewController(recipeDetailsViewController, animated: true)
        }
    }
}

