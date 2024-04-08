//
//  ContentView.swift
//  StarWarsWiki
//
//  Created by Luan Cabral on 05/04/24.
//

import SwiftUI

struct HomeContentView: View {
    @StateObject private var viewModel = HomeContentViewModel()
    @State private var showAlert = false
    
    var body: some View {
        NavigationStack {
            List(viewModel.people) { person in
                NavigationLink(destination: PersonDetails(person: person)) {
                    PersonRowView(person: person)
                }
            }
            .navigationTitle("Star Wars Wiki")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeContentView()
    }
}
