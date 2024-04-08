//
//  PersonModel.swift
//  StarWarsWiki
//
//  Created by Luan Cabral on 05/04/24.
//

import Foundation
import SwiftUI

struct Person: Decodable, Identifiable, Hashable {
    var id: String { url }
    
    let name, birthYear, url, mass, height: String
    let gender: Gender
    
    private enum CodingKeys: String, CodingKey {
        case name, url, mass, height, gender
        case birthYear = "birth_year"
    }
    
    enum Gender: String, Decodable {
        case male = "male"
        case female = "female"
        case other  = "n/a"
        
        var iconColor: Color {
            switch self {
            case .male: return .blue
            case .female: return .red
            case .other: return .gray
            }
        }
    }
}
