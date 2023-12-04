//
//  CardDetailView.swift
//  CVSTest
//
//  Created by Lazaro Neto on 04/12/23.
//

import SwiftUI

struct CardDetailView: View {
    
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            HStack() {
                Text(title)
                    .font(.title)
                    .fontWeight(.semibold)
                Spacer()
            }
            
            Text(subtitle)
                .font(.title2)
        }
        .padding(10)
    }
}

struct CardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CardDetailView(
            title: "title",
            subtitle: "subtitle"
        )
    }
}
