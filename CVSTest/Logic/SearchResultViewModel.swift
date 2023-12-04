//
//  SearchResultViewModel.swift
//  CVSTest
//
//  Created by Lazaro Neto on 04/12/23.
//

import Foundation

protocol SearchResultViewModeling: ObservableObject {
    
    func fetchResults(with searchText: String)
    
    var searchResult: SearchResult? { get }
}

class SearchResultViewModel: SearchResultViewModeling {
    
    var searchResult: SearchResult?
    
    let apiService: FlickrRequest
    let queue = OperationQueue()
    var searchText: String = ""
    
    init(apiService: FlickrRequest) {
        self.apiService = apiService
    }
    
    func fetchResults(with searchText: String) {
        
        self.searchText = searchText
        
        if searchText.isEmpty {
            self.searchResult = nil
            return
        }
        
        self.apiService.fetchImages(
            with: searchText
        ) { [weak self] result in
            print("Resultsssssss for: \(searchText)")
            guard let self else { return }
            guard self.searchText == searchText else {
                print("ira retornar")
                return
            }
            switch result {
            case let .success(searchResult):
                DispatchQueue.main.async {
                    self.searchResult = searchResult
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}
