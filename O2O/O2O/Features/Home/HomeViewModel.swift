//
//  HomeViewModel.swift
//  O2O
//
//  Created by Olga Rodríguez Garrucho on 25/5/23.
//

import Foundation

class HomeViewModel {
    
    // MARK: - Properties
    
    weak var view: HomeViewControllerProtocol?
    var router: HomeRouter?

    private var apiRest: APIProtocol

    var beers = [ProductModelResponse]()
    var searchText: String? = ""
    var page = 1
    var onFire: Bool = false

    // MARK: - Lifecycle

    init(_ apiRest: APIProtocol = API()) {
        self.apiRest = apiRest
    }

    // MARK: - Helpers

    func fetchData() {
        print(page)
        let path = self.searchText?.isEmpty ?? false ? "&page=\(page)" : "food=" + (self.searchText ?? "") + "&page=\(page)"
        apiRest.fetch(.data, textSearch: path) { [weak self ] (result: APITypeResponse<[ProductModelResponse]>) in
            guard let self = self else { return }

            switch result {
            case .success(let data):
                print(data)
                self.beers.removeAll()
                self.beers = data

            case .failure(let error):
                self.view?.showError(error.value ?? "")
                self.beers.removeAll()
            }

            self.view?.reload()
        }
    }

    func searchByFood(searchText: String?) {
        if searchText != "", let searchText = searchText {
            self.searchText = searchText.replacingOccurrences(of: " ", with: "_")
        }
        fetchData()
    }

    func previousDidClicked() {
        self.page -= 1
        fetchData()
    }

    func nextDidClicked() {
        self.page += 1
        fetchData()
    }

    func fireDidClicked() {
        self.onFire.toggle()
        if onFire {
            self.beers = self.beers.filter{ ($0.abv ?? 0) >= 9 }
            self.view?.reload()
        } else {
            self.fetchData()
        }
    }

    func numberOfRowsInSection() -> Int {
        return self.beers.count
    }

    func didSelectRowAt(_ indexPath: IndexPath) {
        let product = self.beers[indexPath.row]

        self.router?.routeToProduct(product)
    }
}
