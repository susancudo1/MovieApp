//
//  MovieListView.swift
//  Movie
//
//  Created by Javier Susa on 27/03/21.
//

import SwiftUI

struct MovieListView: View {
    var viewModel = MovieListViewModel()
    @State private var searchText = ""
    @State private var resultModel: ResultModel?
    var body: some View {
        NavigationView {
            VStack {
                SearchBarView(text: $searchText)
                    .padding(.top)
                if resultModel != nil {
                    List((resultModel?.results.filter({ searchText.isEmpty ?
                                                        true :
                                                        $0.title.lowercased().contains(searchText.lowercased()) }))!,
                         id: \.iden) { movie in
                        ZStack {
                            CellMovieView(title: movie.title,
                                          imageData: movie.imageData)
                            
                        }
                    }
                }
                Spacer()
            }
            .navigationBarTitle("title_app".localized, displayMode: .inline)
        }
        .onAppear {
            self.viewModel.search { (movieModel) in
                guard let movieModel = movieModel else {
                    return
                }
                self.resultModel = movieModel
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
