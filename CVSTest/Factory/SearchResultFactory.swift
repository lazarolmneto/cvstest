//
//  SearchResultFactory.swift
//  CVSTest
//
//  Created by Lazaro Neto on 04/12/23.
//

import Foundation

final class SearchResultFactory {
    
    static func makeViewModel() -> any SearchResultViewModeling {
        
        let service: FlickrRequest = FlickRequester()
        
        return SearchResultViewModel(apiService: service)
    }
}
