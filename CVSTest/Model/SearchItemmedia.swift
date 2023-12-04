//
//  SearchItemmedia.swift
//  CVSTest
//
//  Created by Lazaro Neto on 04/12/23.
//

import Foundation

struct SearchItemMedia: Decodable {
    let media: String
    
    enum CodingKeys: String, CodingKey {
        case media = "m"
    }
}
