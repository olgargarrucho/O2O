//
//  HomeViewControllerProtocol.swift
//  O2O
//
//  Created by Olga Rodríguez Garrucho on 25/5/23.
//

import UIKit

protocol HomeViewControllerProtocol: AnyObject {
    func showError(_ errorMessage: String)
    func reload()
}

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var beersTableView: UITableView!

    var viewModel: HomeViewModel!
    private let barTintColor = UIColor(red: 247/255, green: 132/255, blue: 15/255, alpha: 1.0)

    private let searchBar = UISearchBar()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        viewModel.fetchData()
    }
    

    // MARK: - Selectors
    @objc func showSearchBar() {
        search(shouldShow: true)
        searchBar.becomeFirstResponder()
    }

    @IBAction func previousDidClick(_ sender: Any) {
        viewModel.previousDidClicked()
    }

    @IBAction func nextDidClick(_ sender: Any) {
        viewModel.nextDidClicked()
    }

    // MARK: - Helpers

    private func configureUI() {
        beersTableView.dataSource = self
        beersTableView.delegate = self

        beersTableView.register(HomeTableViewCell.nib, forCellReuseIdentifier: HomeTableViewCell.identifier)

        configureNavigationBar(withTitle: "Beers", prefersLargeTitles: true, barTintColor: barTintColor)
        showSearchBarButton(shouldShow: true)

        searchBar.sizeToFit()
        searchBar.delegate = self
        searchBar.placeholder = "Enter your food here"
        definesPresentationContext = false

        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
            textField.textColor = .darkGray
            textField.backgroundColor = .lightText
        }
        searchBar.becomeFirstResponder()
    }

    private func showSearchBarButton(shouldShow: Bool) {
        navigationItem.rightBarButtonItem = shouldShow ? UIBarButtonItem(barButtonSystemItem: .search,
                                                                         target: self,
                                                                         action: #selector(showSearchBar)) : nil
    }

    private func search(shouldShow: Bool) {
        showSearchBarButton(shouldShow: !shouldShow)
        searchBar.showsCancelButton = shouldShow
        navigationItem.titleView = shouldShow ? searchBar : nil
    }
    
}

// MARK: - HomeViewControllerProtocol

extension HomeViewController: HomeViewControllerProtocol {
    func showError(_ errorMessage: String) {
        DispatchQueue.main.async {
            self.showError(title: "Error", message: errorMessage, onConfirm: {
                _ in
            } )
        }
    }

    func reload() {
        DispatchQueue.main.async {
            self.beersTableView.reloadData()
        }
    }
}


// MARK: - UITableViewDataSource, UITableViewDelegate
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowsInSection()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell {
            cell.setup(self.viewModel.beers[indexPath.row])
            cell.delegate = self
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRowAt(indexPath)
    }
}

// MARK: - HomeTableViewCellDelegate
extension HomeViewController: HomeTableViewCellDelegate {
    func infoDidClicked(_ id: Int) {
        let product = self.viewModel.beers.filter{ $0.id == id }.first
        self.showError(title: "Tips", message: product?.brewersTips,onConfirm: { _ in
        })

    }
}

// MARK: - UISearchBarDelegate
extension HomeViewController: UISearchBarDelegate {

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        viewModel.fetchData()
    }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {}

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {}

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchByFood(searchText: searchText)
    }

}
