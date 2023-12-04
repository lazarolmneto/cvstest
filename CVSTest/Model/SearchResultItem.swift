//
//  SearchResultItem.swift
//  CVSTest
//
//  Created by Lazaro Neto on 04/12/23.
//

import Foundation

struct SearchResultItem: Decodable, Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let link: String
    let media: SearchItemMedia
    let dateTaken: String
    let description: String?
    let published: String
    let author: String
    let authorId: String
    let tags: String?
    
    enum CodingKeys: String, CodingKey {
        case dateTaken = "date_taken"
        case authorId = "author_id"
        case title
        case link
        case media
        case description
        case published
        case author
        case tags
    }
}

//{
//           "title": "massa com azeitona",
//           "link": "https:\/\/www.flickr.com\/photos\/195276496@N04\/51957169229\/",
//           "media": {"m":"https:\/\/live.staticflickr.com\/65535\/51957169229_889f37fa83_m.jpg"},
//           "date_taken": "2014-01-30T11:55:19-08:00",
//           "description": " <p><a href=\"https:\/\/www.flickr.com\/people\/195276496@N04\/\">salomaojunior8<\/a> posted a photo:<\/p> <p><a href=\"https:\/\/www.flickr.com\/photos\/195276496@N04\/51957169229\/\" title=\"massa com azeitona\"><img src=\"https:\/\/live.staticflickr.com\/65535\/51957169229_889f37fa83_m.jpg\" width=\"240\" height=\"159\" alt=\"massa com azeitona\" \/><\/a><\/p> ",
//           "published": "2022-03-23T19:55:34Z",
//           "author": "nobody@flickr.com (\"salomaojunior8\")",
//           "author_id": "195276496@N04",
//           "tags": "tomate azeitona macarrao molho hortela prato"
//      },
