//
//  FlickrRequest.swift
//  CVSTest
//
//  Created by Lazaro Neto on 04/12/23.
//

import Foundation

protocol FlickrRequest {
    func fetchImages(
        with searchText: String,
        completion: ((Result<SearchResult, Error>) -> Void)?
    )
}

class FlickRequester: FlickrRequest {
    
    enum Constants {
        static let url = "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags="
    }
    
    func fetchImages(
        with searchText: String,
        completion: ((Result<SearchResult, Error>) -> Void)?
    ) {
        
        guard let url = URL(string: Constants.url + searchText) else { return }
        
        
        let urlRequest = URLRequest(url: url)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest) { data, response, error in
//            print(data)
//            print(response)
//            print(error)
            
            if let error = error {
                completion?(.failure(error))
                return
            }
            
            guard let data = data else { return }
            let decoder = JSONDecoder()
            if let infos = try? decoder.decode(SearchResult.self, from: data) {
//                print(infos)
                completion?(.success(infos))
                return
            }
        }
        
        task.resume()
    }
}
