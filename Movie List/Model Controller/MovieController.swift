//
//  MovieController.swift
//  Movie List
//
//  Created by Lisa Sampson on 4/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class MovieController {
    
    // MARK: - Properties
    private(set) var movies: [Movie] = []
    
    // MARK: - CRUD
    
    func createMovie(withName movie: String) {
        let movie = Movie(movie: movie)
        
        movies.append(movie)
        movies.sort { (leftMovie, rightMovie) -> Bool in
            return leftMovie.movie < rightMovie.movie
        }
    }
    
    func delete(movie: Movie) {
        guard let index = movies.index(of: movie) else { return }
        movies.remove(at: index)
    }
    
    func toggleIsSeen(for movie: Movie) {
        if movie.isSeen == false {
            movie.isSeen = true
        } else {
            movie.isSeen = false
        }
    }
}
