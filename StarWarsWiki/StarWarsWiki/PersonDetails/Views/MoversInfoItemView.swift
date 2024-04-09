//
//  MoversInfoItemView.swift
//  StarWarsWiki
//
//  Created by Luan Cabral on 08/04/24.
//

import SwiftUI



struct MoversInfoItemView: View {
    struct Data: Hashable {
        let title, subtitle, info: String
    }
    
    let data: Data
    
    var body: some View {
        HStack {
            Image(systemName: "popcorn.fill")
                .resizable()
                .frame(width: 48, height: 62)
                .foregroundColor(.orange)
            Spacer()
            VStack(alignment: .center, spacing: 4) {
                
                // MARK: - Title
                Text(data.title)
                    .font(.body)
                    .fontWeight(.bold)
                
                // MARK: - Subtitle
                Text(data.subtitle)
                    .font(.caption)
                    .fontWeight(.bold)
                
                // MARK: - Info
                Text(data.info)
                    .font(.caption)
                    .fontWeight(.bold)
            }
            Spacer()
        }
        .padding()
        .frame(width: 320, height: 100)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.systemGray), lineWidth: 2)
        }
    }
}

struct MoversInfoItemView_Previews: PreviewProvider {
    static var previews: some View {
        MoversInfoItemView(data: MoversInfoItemView.Data(title: "A New Hope",
                                                         subtitle: "Director: George Lucas",
                                                         info: "Episode: 4"))
    }
}
