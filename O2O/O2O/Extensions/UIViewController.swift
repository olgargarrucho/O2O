//
//  UIViewController.swift
//  O2O
//
//  Created by Olga Rodríguez Garrucho on 25/5/23.
//

import Foundation
import UIKit

extension UIViewController {

    public func configureNavigationBar(withTitle title: String,
                                       prefersLargeTitles: Bool,
                                       barTintColor: UIColor = .systemPink) {

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.darkGray]
        appearance.backgroundColor = barTintColor

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance

        navigationController?.navigationBar.prefersLargeTitles = prefersLargeTitles
        navigationItem.title = title
        navigationController?.navigationBar.tintColor = .darkGray
        navigationController?.navigationBar.isTranslucent = true

        navigationController?.navigationBar.overrideUserInterfaceStyle = .dark
    }

    public func showError(title: String? = nil, message: String? = nil, onConfirm: @escaping (UIAlertAction) -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .destructive, handler: onConfirm)
        alert.addAction(okAction)

        self.present(alert, animated: true, completion: nil)
    }
}
