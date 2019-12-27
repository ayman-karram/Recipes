//
//  RecipeDetailsViewController.swift
//  Recipes
//
//  Created by Ayman Karram on 25.12.19.
//  Copyright © 2019 Ayman Karram. All rights reserved.
//

import UIKit
import Nuke

class RecipeDetailsViewController: UIViewController {

    //MARK:- @IBOutlet
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var tagesLabel: UILabel!
    @IBOutlet weak var chefNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    //MARK:- Variables
    var viewModel: RecipeDetailsViewModel?

    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }

    //MARK:- Helpers
    func bindViewModel(){
        guard let viewModel = self.viewModel else {
            return
        }
        if let imageURL = self.viewModel?.imageURL {
            let options = ImageLoadingOptions(transition: .fadeIn(duration: 0.8))
            Nuke.loadImage(with: imageURL, options: options, into: recipeImageView)
        }
        recipeTitleLabel.text = viewModel.title
        chefNameLabel.text = viewModel.chefName
        tagesLabel.text = viewModel.tags
        descriptionLabel.text = viewModel.description
    }

}
