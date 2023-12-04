//
//  DetailView.swift
//  CVSTest
//
//  Created by Lazaro Neto on 04/12/23.
//

import SwiftUI

struct DetailView: View {
    
    let item: SearchResultItem
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                CardDetailView(title: "Title", subtitle: item.title)
                CardDetailView(title: "Author", subtitle: item.author)
                CardDetailView(title: "Description", subtitle: item.description ?? "")
            }//: VSTACK
            .padding()
        }//: SCROLL
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let item = SearchResultItem(
            title: "Title image",
            link: "https://www.flickr.com//photos//195276496@N04//51957169229//",
            media: SearchItemMedia(
                media: "https://live.staticflickr.com/65535/51957169229_889f37fa83_m.jpg"
            ),
            dateTaken: "Date taken",
            description: "Desc",
            published: "",
            author: "author",
            authorId: "",
            tags: "")
        
        DetailView(item: item)
    }
}
