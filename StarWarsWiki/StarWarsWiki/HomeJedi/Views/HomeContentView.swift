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
                        .onAppear{
                            if person.id == viewModel.people.last?.id {
                                viewModel.fetchNextPage()
                            }
                        }
                }
            }
            .refreshable {
                viewModel.handleRefresh()
            }
            .onReceive(viewModel.$error, perform: { error in
                if error != nil {
                    showAlert.toggle()
                }
            })
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text("Error"),
                      message: Text(viewModel.error?.localizedDescription ?? ""))
            })
            .navigationTitle("StarWars Wiki")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeContentView()
    }
}
