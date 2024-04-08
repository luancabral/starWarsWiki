//
//  MoversInfoView.swift
//  StarWarsWiki
//
//  Created by Luan Cabral on 08/04/24.
//

import SwiftUI

struct MoversInfoView: View {
    let data: [MoversInfoItemView.Data]
    let title: String
    
    init(_ data: [MoversInfoItemView.Data], title: String) {
        self.data = data
        self.title = title
    }
    var body: some View {
        VStack(alignment: .center) {
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
            
            ScrollView(.vertical){
                VStack(spacing: 12) {
                    ForEach(data, id: \.self) { film in
                        MoversInfoItemView(data: film)
                    }
                }
            }
        }
        .padding()
    }
}

struct MoversInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MoversInfoView([MoversInfoItemView.Data(title: "", subtitle: "", info: "")], title: "Titulo")
    }
}
