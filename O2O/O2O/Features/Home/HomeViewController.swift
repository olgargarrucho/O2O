//
//  HomeViewControllerProtocol.swift
//  O2O
//
//  Created by Olga Rodríguez Garrucho on 25/5/23.
//

import UIKit

protocol HomeViewControllerProtocol: AnyObject {

}

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    var viewModel: HomeViewModel!
    
    
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

// MARK: - HomeViewControllerProtocol

extension HomeViewController: HomeViewControllerProtocol {

}
