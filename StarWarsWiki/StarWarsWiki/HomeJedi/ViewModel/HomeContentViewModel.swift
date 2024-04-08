//
//  HomeContentViewModel.swift
//  StarWarsWiki
//
//  Created by Luan Cabral on 05/04/24.
//

import Foundation

final class HomeContentViewModel: ObservableObject {
    @Published var people = [Person]()
    @Published var error: Error?
    
    var page: Page?
    
    let service: StarWarsServiceProtocol
    let baseURL = "https://swapi.dev/api/people"
    
    init(service: StarWarsServiceProtocol = StarWarsService()) {
        self.service = service
        fetchPersonPage(baseURL)
    }
    
    func handleRefresh() {
        people.removeAll()
        fetchPersonPage(baseURL)
    }
    
    func fetchPersonPage(_ urlString: String) {
        service.fetchPage(url: urlString) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let page):
                self.people.append(contentsOf: page.results)
                self.page = page
            case .failure(let error):
                self.error = error
            }
        }
    }
    
    func fetchNextPage() {
        guard let nextPageUrl = page?.next else { return }
        fetchPersonPage(nextPageUrl)
    }
    
}
