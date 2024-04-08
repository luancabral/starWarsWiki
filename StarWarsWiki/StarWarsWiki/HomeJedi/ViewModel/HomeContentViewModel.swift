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
    
    let service: StarWarsServiceProtocol
    
    init(service: StarWarsServiceProtocol = StarWarsService()) {
        self.service = service
        fetchPersonPage()
    }
    
    func fetchPersonPage() {
        service.fetchPage { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let page):
                self.people = page.results
            case .failure(let error):
                self.error = error
            }
        }
    }
}
