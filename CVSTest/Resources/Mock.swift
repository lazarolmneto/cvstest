//
//  Mock.swift
//  CVSTest
//
//  Created by Lazaro Neto on 04/12/23.
//

import Foundation

struct SearchResultMock {
    
    static func make() -> SearchResult {
        
        var items = [SearchResultItem]()
        for _ in 0..<10 {
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
            
            items.append(item)
        }
        
        let result = SearchResult(
            title: "",
            link: "",
            description: "",
            modified: "",
            generator: "",
            items: items)
        
        return result
    }
}
