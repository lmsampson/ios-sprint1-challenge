//
//  Movie.swift
//  Movie List
//
//  Created by Lisa Sampson on 7/27/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class Movie {
    let movie: String
    var isSeen: Bool = false
    
    init(movie: String) {
        self.movie = movie
    }
}
