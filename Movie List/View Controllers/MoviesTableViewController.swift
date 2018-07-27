//
//  MoviesTableViewController.swift
//  Movie List
//
//  Created by Lisa Sampson on 7/27/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class MoviesTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MovieTableViewCellDelegate, MovieControllerProtocol {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieController?.movies.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
        
        guard let movieCell = cell as? MovieTableViewCell else { return cell }
        
       // let movie = movieController?.movies[indexPath.row]
       // movieCell.movie = movie
        movieCell.delegate = self
        
        return movieCell
    }

    func isSeenButtonWasTapped(on cell: MovieTableViewCell) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    
    var movieController: MovieController?
    
}
