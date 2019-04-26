//
//  PersistenceExtension.swift
//  Movie List
//
//  Created by Lisa Sampson on 4/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

extension MovieController {
    
    // MARK: - Properties
    
    var movieURL: URL? {
        guard let docDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let filename = "Movies.plist"
        return docDir.appendingPathComponent(filename)
    }
    
    // MARK: - Persistence Methods
    
    func saveToPersistence() {
        let plistEncoder = PropertyListEncoder()
        
        do {
            guard let movie = movieURL else { return }
            let movieArr = try plistEncoder.encode(movies)
            try movieArr.write(to: movie)
        } catch let error {
            NSLog("Error trying to save data: \(error)")
        }
    }
    
    func loadFromPersistence() {
        let plistDecoder = PropertyListDecoder()
        
        do {
            guard let movie = movieURL else { return }
            let movieArr = try Data(contentsOf: movie)
            let decodedMovies = try plistDecoder.decode([Movie].self, from: movieArr)
            self.movies = decodedMovies
        } catch let error {
            NSLog("Error trying to save data: \(error)")
        }
    }
}
