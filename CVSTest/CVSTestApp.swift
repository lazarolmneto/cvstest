//
//  CVSTestApp.swift
//  CVSTest
//
//  Created by Lazaro Neto on 04/12/23.
//

import SwiftUI

@main
struct CVSTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                result: SearchResultMock.make(),
                viewModel: SearchResultFactory.makeViewModel() as! SearchResultViewModel
            )
        }
    }
}
