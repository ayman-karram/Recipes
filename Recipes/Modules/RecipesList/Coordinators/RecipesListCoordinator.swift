//
//  RecipesListCoordinator.swift
//  Recipes
//
//  Created by Ayman Karram on 25.12.19.
//  Copyright © 2019 Ayman Karram. All rights reserved.
//

import UIKit

class RecipesListCoordinator: Coordinator {

    //MARK:- Variables
    var navigationController: UINavigationController

    //MARK:- Init
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    //MARK:- Helpers
    func getViewController() -> UIViewController {
        return RecipesListViewController()
    }

    func show(present: Bool = false) {
        let recipesListViewController = getViewController()
        if present {
            recipesListViewController.modalTransitionStyle = .crossDissolve
            self.navigationController.viewControllers.last?.present(recipesListViewController,
                                                                    animated: true, completion: nil)
        } else {
            self.navigationController.navigationBar.prefersLargeTitles = true
            self.navigationController.pushViewController(recipesListViewController, animated: true)
        }
    }
}
