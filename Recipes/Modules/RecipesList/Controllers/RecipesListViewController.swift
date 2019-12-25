//
//  RecipesListViewController.swift
//  Recipes
//
//  Created by Ayman Karram on 25.12.19.
//  Copyright © 2019 Ayman Karram. All rights reserved.
//

import UIKit

class RecipesListViewController: UIViewController {

    //MARK:- @IBOutlet
    @IBOutlet weak var recipesTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    //MARK:- Variables
    private let viewModel: RecipesViewModel = RecipesViewModel()

    private let naviagtionTitle = "Recipes"

    //MARK:- View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        bindViewModel()
        viewModel.fetchRecipes()
    }

    //MARK:- Helpers
    private func setupView(){
        title = naviagtionTitle
        setUpTableView()
    }

    private func bindViewModel() {
        viewModel.recipesCellsViewModels.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.recipesTableView?.reloadData()
            }
        }
        viewModel.state.bind({[weak self] state in
            switch state {
            case .loading:
                self?.show(loading: true)
            case .finishedLoading:
                self?.show(loading: false)
            case .error(_):
                self?.show(loading: false)
            }
        })
    }

    private func show(loading: Bool) {
        DispatchQueue.main.async {
            self.recipesTableView?.isHidden = loading
            self.activityIndicator.isHidden = !loading
        }
    }

    private func setUpTableView() {
        recipesTableView.register(UINib(nibName: RecipeTableCellViewModel.identifier, bundle: nil), forCellReuseIdentifier: RecipeTableCellViewModel.identifier)
        recipesTableView.dataSource = self
        recipesTableView.delegate = self
        recipesTableView.estimatedRowHeight = UITableView.automaticDimension
        recipesTableView.tableFooterView = UIView()
    }
}

extension RecipesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.recipesCellsViewModels.value.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RecipeTableCellViewModel.identifier) as? RecipeTableViewCell else {
            return UITableViewCell()
        }
        cell.viewModel = viewModel.recipesCellsViewModels.value[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
