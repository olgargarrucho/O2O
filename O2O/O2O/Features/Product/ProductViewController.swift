//
//  ProductViewControllerProtocol.swift
//  O2O
//
//  Created by Olga Rodríguez Garrucho on 25/5/23.
//

import UIKit

protocol ProductViewControllerProtocol: AnyObject {

}

class ProductViewController: UIViewController {
    
    // MARK: - Properties
    
    var viewModel: ProductViewModel!
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    

    // MARK: - Selectors

    
    // MARK: - Helpers

    private func configureUI() {
        view.backgroundColor = .systemPurple

    }
    
}

// MARK: - ProductViewControllerProtocol

extension ProductViewController: ProductViewControllerProtocol {

}
