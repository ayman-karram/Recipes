//
//  Coordinator.swift
//  Recipes
//
//  Created by Ayman Karram on 25.12.19.
//  Copyright © 2019 Ayman Karram. All rights reserved.
//

import UIKit

protocol Coordinator {
    var  navigationController: UINavigationController { get set }
    func getViewController() -> UIViewController
    func show(present: Bool)
}
