//
//  MoviesTableViewController.swift
//  Movie List
//
//  Created by Lisa Sampson on 7/27/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class MoviesTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MovieTableViewCellDelegate, MovieControllerProtocol, UISearchResultsUpdating {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredMovies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
        
        guard let movieCell = cell as? MovieTableViewCell else { return cell }
        
        let movie = filteredMovies?[indexPath.row]
        movieCell.movie = movie
        movieCell.delegate = self
        
        return movieCell
    }

    func isSeenButtonWasTapped(on cell: MovieTableViewCell) {
        guard let indexPath = movieTableView.indexPath(for: cell) else { return }
        guard let movie = cell.movie else { return }

        movieController?.toggleIsSeen(for: movie)
        movieTableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieTableView.dataSource = self
        movieTableView.delegate = self
        
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        movieTableView.tableHeaderView = searchController.searchBar
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let movie = filteredMovies?[indexPath.row] else { return }
            movieController?.delete(movie: movie)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            filteredMovies = movieController?.movies.filter { movie in
                return movie.movie.lowercased().contains(searchText.lowercased())
            }
            
        } else {
            filteredMovies = movieController?.movies
        }
        
        movieTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        filteredMovies = movieController?.movies
        movieTableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        searchController.isActive = false
    }
    
    var filteredMovies: [Movie]?
    let searchController = UISearchController(searchResultsController: nil)
    
    var movieController: MovieController?
    
    @IBOutlet weak var movieTableView: UITableView!
    
}
