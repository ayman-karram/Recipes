//
//  RecipesListViewController.swift
//  Recipes
//
//  Created by Ayman Karram on 25.12.19.
//  Copyright © 2019 Ayman Karram. All rights reserved.
//

import UIKit

class RecipesListViewController: UIViewController {

    //MARK:- Variables
    let naviagtionTitle = "Recipes"

    //MARK:- View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    //MARK:- Helpers
    func setupView(){
        title = naviagtionTitle
    }
}
