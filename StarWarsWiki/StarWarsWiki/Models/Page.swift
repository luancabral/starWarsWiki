//
//  Page.swift
//  StarWarsWiki
//
//  Created by Luan Cabral on 05/04/24.
//

import Foundation

struct Page: Decodable {
    let count: Int
    let next: String?
    let results: [Person]
}
