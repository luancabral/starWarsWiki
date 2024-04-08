//
//  PersonDetails.swift
//  StarWarsWiki
//
//  Created by Luan Cabral on 07/04/24.
//

import SwiftUI

struct PersonDetails: View {
    let person: Person
    var body: some View {
        Text("Hello, \(person.name)")
    }
}

struct PersonDetails_Previews: PreviewProvider {
    static var previews: some View {
        PersonDetails(person: Person(name: "Luke",
                                     birthYear: "",
                                     url: "",
                                     mass: "",
                                     height: "",
                                     gender: .male))
    }
}
