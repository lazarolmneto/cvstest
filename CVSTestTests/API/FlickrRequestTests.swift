//
//  FlickrRequestTests.swift
//  CVSTestTests
//
//  Created by Lazaro Neto on 04/12/23.
//

import XCTest
@testable import CVSTest

class FlickrRequesterMock: FlickrRequest {
    func fetchImages(with searchText: String, completion: ((Result<CVSTest.SearchResult, Error>) -> Void)?) {
        let usersStrJSON = """
        {
                "title": "Recent Uploads tagged macarrao",
                "link": "https://www.flickr.com/photos/tags/macarrao/",
                "description": "",
                "modified": "2022-03-23T19:55:34Z",
                "generator": "https://www.flickr.com",
                "items": [
               {
                    "title": "massa com azeitona",
                    "link": "https://www.flickr.com/photos/195276496@N04/51957169229/",
                    "media": {"m":"https://live.staticflickr.com/65535/51957169229_889f37fa83_m.jpg"},
                    "date_taken": "2014-01-30T11:55:19-08:00",
                    "description": "asdada",
                    "published": "2022-03-23T19:55:34Z",
                    "author": "nobody@flickr.com",
                    "author_id": "195276496@N04",
                    "tags": "tomate azeitona macarrao molho hortela prato"
               },
               {
                    "title": "Ida a  Luiz do Purun",
                    "link": "https://www.flickr.com/photos/ifotum/51206639077/",
                    "media": {"m":"https://live.staticflickr.com/65535/51206639077_a4f30b1ca9_m.jpg"},
                    "date_taken": "2021-05-26T16:09:14-08:00",
                    "description": " adsasdas ",
                    "published": "2021-05-27T22:14:10Z",
                    "author": "nobody@flickr.com",
                    "author_id": "67537356@N08",
                    "tags": "cachoeira macarrao flor ensolarado paran amigos trem saoluizdopuruna"
               }
            ]
        }

        """
        
        let data = usersStrJSON.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        do {
            let infos = try decoder.decode(SearchResult.self, from: data)
            print(infos)
            completion?(.success(infos))
        }
        catch let error {
            completion?(.failure(error))
        }
    }
}

final class FlickrRequestTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchUsers() throws {
        
        let mock = FlickrRequesterMock()
        
        let expectation = XCTestExpectation(description: "search mock expectation")
        
        var result: SearchResult?
        
        mock.fetchImages(
            with: "pasta"
        ) { response in
            switch response {
            case let .success(searchResult):
                result = searchResult
            case let .failure(error):
                print(error)
            }
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
        
        XCTAssert(result != nil)
        XCTAssert(result?.items?.count == 2)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
