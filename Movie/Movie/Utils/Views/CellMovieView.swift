//
//  CellMovieView.swift
//  Movie
//
//  Created by Javier Susa on 27/03/21.
//

import SwiftUI

struct CellMovieView: View {
    var title: String
    var imageData: Data?

    var body: some View {
        VStack {
            if imageData != nil {
                Image(uiImage: UIImage(data: imageData!)!)
                    .resizable()
                    .scaledToFill()
            } else {
            Image(systemName: "film")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            }

            Text(title)
                .font(.title)

        }

    }
}

struct CellMovieView_Previews: PreviewProvider {
    static var previews: some View {
        CellMovieView(title: "Titulo de pelicula")
    }
}
