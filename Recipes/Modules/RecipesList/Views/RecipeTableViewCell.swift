//
//  RecipeTableViewCell.swift
//  Recipes
//
//  Created by Ayman Karram on 25.12.19.
//  Copyright © 2019 Ayman Karram. All rights reserved.
//

import UIKit
import Nuke

class RecipeTableViewCell: UITableViewCell {

    //MARK:- @IBOutlet
    @IBOutlet weak var recipeimageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    //MARK:- Variables
    var viewModel: RecipeTableCellViewModel? {
        didSet {
            bindViewModel()
        }
    }

    //MARK:- Helpers
    private func bindViewModel() {
        if let imageURL = self.viewModel?.imageURL {
            let options = ImageLoadingOptions(
                transition: .fadeIn(duration: 0.5)
            )
            Nuke.loadImage(with: imageURL, options: options, into: recipeimageView)
        }
        self.titleLabel?.text = self.viewModel?.title
    }
    
}
