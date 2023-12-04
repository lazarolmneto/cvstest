//
//  ContentView.swift
//  CVSTest
//
//  Created by Lazaro Neto on 04/12/23.
//

import SwiftUI

struct ContentView<ViewModel: SearchResultViewModeling>: View {
    
    let result: SearchResult
    
    @ObservedObject var viewModel: ViewModel
    
    @State private var searchText = ""
    @State private var selectedItem: SearchResultItem?
    @State private var isSelectedItem: Bool = false
    
    var body: some View {
        
        NavigationStack {
            if let searchResult = viewModel.searchResult {
                ScrollView(.vertical, showsIndicators: false, content: {
                    VStack(spacing: 0) {
                        Text("Result - Images")
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        var gridLayout: [GridItem] {
                          return Array(repeating: GridItem(.flexible(), spacing: 10), count: 2)
                        }
                        
                        LazyVGrid(columns: gridLayout, spacing: 15, content: {
                            ForEach(searchResult.items ?? []) { item in
                                ImageItem(item: item)
                                    .onTapGesture {
                                        self.selectedItem = item
                                        self.isSelectedItem = true
                                    }
                            }//: LOOP
                        }) //: GRID
                        .padding(15)
                    } //: VSTACK
                }) //: SCROLL
            }
        }
        .searchable(text: $searchText)
        .onChange(of: searchText) { newValue in
            self.viewModel.fetchResults(with: searchText)
        }
        .sheet(isPresented: self.$isSelectedItem) {
            if let selectedItem = self.selectedItem {
                DetailView(item: selectedItem)
            }
        }
        //: NAVIGATION STACK
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            result: SearchResultMock.make(),
            viewModel: SearchResultFactory.makeViewModel() as! SearchResultViewModel
        )
    }
}
