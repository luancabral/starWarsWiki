//
//  StarWarsService.swift
//  StarWarsWiki
//
//  Created by Luan Cabral on 07/04/24.
//

import Foundation

protocol StarWarsServiceProtocol {
    func fetchPage(url: String, completion: @escaping (Result<Page, APIError>) -> Void)
}

final class StarWarsService: StarWarsServiceProtocol {
    let serviceManager = ServiceManager()
    
    func fetchPage(url: String, completion: @escaping (Result<Page, APIError>) -> Void) {
        serviceManager.get(with: url, dataType: Page.self) { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}
