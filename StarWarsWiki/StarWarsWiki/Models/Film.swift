//
//  Film.swift
//  StarWarsWiki
//
//  Created by Luan Cabral on 08/04/24.
//

import Foundation

struct Film: Decodable, Identifiable {
    var id: Int { episode }
    
    let title, director, releaseDate : String
    let episode: Int
    
    private enum CodingKeys: String, CodingKey {
        case title, director
        case episode = "episode_id"
        case releaseDate = "release_date"
    }
}
