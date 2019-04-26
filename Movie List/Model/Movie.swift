//
//  Movie.swift
//  Movie List
//
//  Created by Lisa Sampson on 4/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class Movie: Equatable {
    
    var movie: String
    var isSeen: Bool = false
    
    init (movie: String) {
        self.movie = movie
    }
    
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        return lhs.movie == rhs.movie && lhs.isSeen == rhs.isSeen
    }
}
