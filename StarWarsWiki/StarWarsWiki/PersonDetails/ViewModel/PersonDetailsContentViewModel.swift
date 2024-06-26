//
//  PersonDetailsContentViewModel.swift
//  StarWarsWiki
//
//  Created by Luan Cabral on 08/04/24.
//

import Foundation

final class PersonDetailsContentViewModel: ObservableObject {
    @Published var films = [Film]()
    @Published var isLoading = false
    
    let service: StarWarsServiceProtocol
    let person: Person
    
    init(person: Person, service: StarWarsService = StarWarsService()) {
        self.person = person
        self.service = service
        fetchFilms()
    }
    
    private func fetchFilms() {
        self.isLoading = true
        person.films.forEach { filmUrl in
            service.fetchFilm(url: filmUrl) { result in
                self.isLoading = false
                switch result {
                case .success(let film):
                    self.films.append(film)
                case .failure(_):
                    break
                }
            }
        }
       
    }
    
    func getFilms() -> [MoversInfoItemView.Data] {
        var data = [MoversInfoItemView.Data]()
        films.forEach { film in
            let filmData = MoversInfoItemView.Data(title: film.title, subtitle: film.releaseDate, info: "EP: \(film.episode)")
            data.append(filmData)
        }
        
        return data.sorted { $0.info < $1.info }
    }
    
}
