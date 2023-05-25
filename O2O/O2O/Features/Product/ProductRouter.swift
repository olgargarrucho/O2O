//
//  ProductRouter.swift
//  O2O
//
//  Created by Olga Rodríguez Garrucho on 25/5/23.
//

import Foundation

class ProductRouter {
    
    // MARK: - Properties
    
    weak var viewController: ProductViewController?

    // MARK: - Helpers
    
    static func getViewController() -> ProductViewController {
        let configuration = configureModule()

        return configuration.vc
    }
    
    private static func configureModule() -> (vc: ProductViewController, vm: ProductViewModel, rt: ProductRouter) {
        let viewController = ProductViewController()
        let router = ProductRouter()
        let viewModel = ProductViewModel()

        viewController.viewModel = viewModel

        viewModel.router = router
        viewModel.view = viewController

        router.viewController = viewController

        return (viewController, viewModel, router)
    }
    
    // MARK: - Routes
    
}
