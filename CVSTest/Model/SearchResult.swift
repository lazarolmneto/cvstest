//
//  SearchResult.swift
//  CVSTest
//
//  Created by Lazaro Neto on 04/12/23.
//

struct SearchResult: Decodable {
    let title: String
    let link: String
    let description: String?
    let modified: String?
    let generator: String
    let items: [SearchResultItem]?
}

//"title": "Recent Uploads tagged macarrao",
//        "link": "https:\/\/www.flickr.com\/photos\/tags\/macarrao\/",
//        "description": "",
//        "modified": "2022-03-23T19:55:34Z",
//        "generator": "https:\/\/www.flickr.com",
//        "items": [
