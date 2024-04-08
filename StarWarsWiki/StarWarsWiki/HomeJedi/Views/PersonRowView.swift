//
//  PersonRowView.swift
//  StarWarsWiki
//
//  Created by Luan Cabral on 05/04/24.
//

import SwiftUI

struct PersonRowView: View {
    let person: Person
    
    var body: some View {
        HStack {
            //Gender image
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .foregroundColor(person.gender.iconColor)
            //name and birth year
            VStack(alignment: .leading, spacing: 4) {
                Text(person.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                
                Text("Birth Year: \(person.birthYear)")
                    .font(.caption)
                    .padding(.leading, 4)
            }
            .padding(.leading, 2)
            
            Spacer()
            
            //mass and height
            VStack(alignment: .trailing, spacing: 4) {
                Text("Height: \(person.height)")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                
                Text("Mass: \(person.mass)")
                    .font(.caption)
                    .padding(.leading, 4)
            }
            .padding(.leading, 2)
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

struct PersonRowView_Previews: PreviewProvider {
    static var previews: some View {
        PersonRowView(person: Person(name: "Luke Skywalker",
                                     birthYear: "19BBY",
                                     url: "https://swapi.dev/api/people/1/",
                                     mass: "77",
                                     height: "172", gender: .female))
    }
}
