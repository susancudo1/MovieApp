//
//  MovieDetailView.swift
//  Movie
//
//  Created by Javier Susa on 27/03/21.
//

import SwiftUI

struct MovieDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    var movie: MovieModel

    var body: some View {
        VStack {
            if movie.imageData != nil {
                Image(uiImage: UIImage(data: movie.imageData!)!)
                    .resizable()
                    .scaledToFit()
            } else {
                Image(systemName: "film")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
            }

            ScrollView {
                HStack {
                    VStack(alignment: .leading) {
                        Text("detail_view_title_description".localized)
                            .font(.system(.title, design: .rounded))
                            .padding(.top)
                        Text(movie.overview)
                            .font(.system(.body, design: .rounded))

                        Text("detail_view_title_original_language".localized)
                            .font(.system(.title, design: .rounded))
                            .padding(.top)
                        Text(movie.originalLanguage)
                            .font(.system(.body, design: .rounded))

                        Text("detail_view_title_original_title".localized)
                            .font(.system(.title, design: .rounded))
                            .padding(.top)
                        Text(movie.originalTitle)
                            .font(.system(.body, design: .rounded))

                        Text("detail_view_title_popularity".localized)
                            .font(.system(.title, design: .rounded))
                            .padding(.top)
                        Text("\(movie.popularity)")
                            .font(.system(.body, design: .rounded))

                        Text("detail_view_title_vote_average".localized)
                            .font(.system(.title, design: .rounded))
                            .padding(.top)
                        Text("\(movie.voteAverage)")
                            .font(.system(.body, design: .rounded))
                    }
                    .padding()
                    Spacer()
                }
            }
        }.navigationBarTitle(movie.title, displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "chevron.backward")
                .font(.body)
                .foregroundColor(.black)
        }))
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: MovieModel(adult: false,
                                          backdropPath: "",
                                          genreIds: [0],
                                          iden: 0,
                                          originalLanguage: "",
                                          originalTitle: "",
                                          overview: "",
                                          popularity: 0.0,
                                          posterPath: "",
                                          releaseDate: "",
                                          title: "",
                                          video: false,
                                          voteAverage: 0.0,
                                          voteCount: 0,
                                          imageData: nil))
    }
}
