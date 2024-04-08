//
//  PersonDetailsContentView.swift
//  StarWarsWiki
//
//  Created by Luan Cabral on 07/04/24.
//

import SwiftUI

struct PersonDetailsContentView: View {
    @StateObject var viewModel: PersonDetailsContentViewModel
    
    
    init(person: Person) {
        _viewModel = StateObject(wrappedValue: PersonDetailsContentViewModel(person: person))
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            MoversInfoView(viewModel.getFilms(), title: "Movies")
        }
        .navigationTitle(viewModel.person.name)
    }
}

struct PersonDetails_Previews: PreviewProvider {
    static var previews: some View {
        PersonDetailsContentView(person: Person(name: "Luke",
                                                birthYear: "",
                                                url: "",
                                                mass: "",
                                                height: "",
                                                films: [],
                                                gender: .male))
    }
}
