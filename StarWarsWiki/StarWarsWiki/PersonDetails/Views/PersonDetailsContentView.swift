//
//  PersonDetailsContentView.swift
//  StarWarsWiki
//
//  Created by Luan Cabral on 07/04/24.
//

import SwiftUI

struct PersonDetailsContentView: View {
    @StateObject var viewModel: PersonDetailsContentViewModel
    @State private var showAlert = false
    
    
    init(person: Person) {
        _viewModel = StateObject(wrappedValue: PersonDetailsContentViewModel(person: person))
    }
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false){
                MoversInfoView(viewModel.getFilms(), title: "Movies")
            }
            .navigationTitle(viewModel.person.name)
            
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
                    .scaleEffect(3)
            }
        }
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
