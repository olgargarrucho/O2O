//
//  HomeTableViewCell.swift
//  O2O
//
//  Created by Olga Rodríguez Garrucho on 25/5/23.
//

import UIKit
import SDWebImage

protocol HomeTableViewCellDelegate: AnyObject {
    func infoDidClicked(_ id: Int)
}

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!

    var delegate: HomeTableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setup(_ product: ProductModelResponse?) {
        guard let product = product else { return }

        let imageURL = product.imageURL ?? ""
        let url = URL(string: imageURL)
        self.productImage.sd_setImage(with: url)

        var textFood = ""
        for food in product.foodPairing ?? [] {
           textFood = textFood + food + "\n"
        }
        self.foodLabel.text = textFood

        self.infoButton.tag = product.id ?? 0
    }
    
    @IBAction func infoDidClick(_ sender: UIButton) {
        self.delegate?.infoDidClicked(sender.tag)
    }
}
