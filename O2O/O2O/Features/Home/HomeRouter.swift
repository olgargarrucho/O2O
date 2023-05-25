//
//  HomeRouter.swift
//  O2O
//
//  Created by Olga Rodríguez Garrucho on 25/5/23.
//

import Foundation

class HomeRouter {
    
    // MARK: - Properties
    
    weak var viewController: HomeViewController?

    // MARK: - Helpers
    
    static func getViewController() -> HomeViewController {
        let configuration = configureModule()

        return configuration.vc
    }
    
    private static func configureModule() -> (vc: HomeViewController, vm: HomeViewModel, rt: HomeRouter) {
        let viewController = HomeViewController()
        let router = HomeRouter()
        let viewModel = HomeViewModel()

        viewController.viewModel = viewModel

        viewModel.router = router
        viewModel.view = viewController

        router.viewController = viewController

        return (viewController, viewModel, router)
    }
    
    // MARK: - Routes

    func routeToProduct(_ product: ProductModelResponse?) {
        let viewController = ProductRouter.getViewController()
        viewController.viewModel.product = product
        self.viewController?.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
