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
    
    @IBOutlet weak var ipaImage: UIImageView!
    @IBOutlet weak var beerDescription: UILabel!
    @IBOutlet weak var beerTagline: UILabel!
    @IBOutlet weak var beerName: UILabel!
    @IBOutlet weak var beerImage: UIImageView!

    var viewModel: ProductViewModel!
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    

    // MARK: - Selectors

    
    // MARK: - Helpers

    private func configureUI() {
        guard let product = viewModel.product else { return }

        let image = product.imageURL ?? ""
        let url = URL(string: image)
        self.beerImage.sd_setImage(with: url)

        self.beerName.text = product.name ?? ""
        self.beerTagline.text = product.tagline ?? ""
        self.beerDescription.text = product.description ?? ""
        if (product.tagline?.contains("IPA") ?? false) || (product.name?.contains("IPA") ?? false) {
            self.ipaImage.isHidden = false

        } else {
            self.ipaImage.isHidden = true
        }
    }
    
}

// MARK: - ProductViewControllerProtocol

extension ProductViewController: ProductViewControllerProtocol {

}
