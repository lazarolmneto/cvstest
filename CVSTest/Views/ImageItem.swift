//
//  ImageView.swift
//  CVSTest
//
//  Created by Lazaro Neto on 04/12/23.
//

import SwiftUI

struct ImageItem: View {
    
    let item: SearchResultItem
    
    var body: some View {
        ZStack {
            
            if let url = URL(string: item.media.media) {
                AsyncImage(
                    url: url
                ) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    Image("placeholderImage")
                        .resizable()
                        .scaledToFit()
                }
            } else {
                Image("placeholderImage")
                    .resizable()
                    .scaledToFit()
            }
        }
    }
}

struct ImageItem_Previews: PreviewProvider {
    static var previews: some View {
        
        let item = SearchResultItem(
            title: "",
            link: "https://www.flickr.com//photos//195276496@N04//51957169229//",
            media: SearchItemMedia(
                media: "https://live.staticflickr.com/65535/51957169229_889f37fa83_m.jpg"
            ),
            dateTaken: "",
            description: "",
            published: "",
            author: "",
            authorId: "",
            tags: "")
        
        ImageItem(item: item)
    }
}
