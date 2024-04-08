//
//  ServiceManager.swift
//  StarWarsWiki
//
//  Created by Luan Cabral on 07/04/24.
//

import Foundation

final class ServiceManager {
    private let urlSession: URLSession
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func get<T: Decodable>(with baseUrl: String, dataType: T.Type, completion: @escaping (Result<T, APIError>) -> Void) {
        guard let url = URL(string: baseUrl) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let request = URLRequest(url: url)
        //            request.httpMethod = "GET"  // optional
        //        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        urlSession.dataTask(with: request){ data, response, error in
            
            if let error = error {
                completion(.failure(.unkown(error)))
                return
            }
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                completion(.failure(.serverError))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(.invalidData))
            }
        }.resume()
    }
    
}
