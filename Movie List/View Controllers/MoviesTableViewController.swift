//
//  MoviesTableViewController.swift
//  Movie List
//
//  Created by Lisa Sampson on 4/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class MoviesTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, MovieTableViewCellDelegate, MovieControllerProtocol, UISearchResultsUpdating {
    
    // MARK: - Properties and Outlets
    
    var movieController: MovieController?
    var filteredMovies: [Movie]?
    let searchController = UISearchController(searchResultsController: nil)
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View Loading
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        filteredMovies = movieController?.movies
        tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        searchController.isActive = false
    }
    
    // MARK: - TableView Data Source and Delegate Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredMovies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
        
        guard let movieCell = cell as? MovieTableViewCell else { return cell }
        
        let movie = filteredMovies?[indexPath.row]
        movieCell.movie = movie
                
        return movieCell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let movie = filteredMovies?[indexPath.row] else { return }
            movieController?.delete(movie: movie)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Search Delegate Methods
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text,
            !searchText.isEmpty {
            filteredMovies = movieController?.movies.filter({ (movie) -> Bool in
                return movie.movie.lowercased().contains(searchText.lowercased())
            })
        } else {
            filteredMovies = movieController?.movies
        }
        
        tableView.reloadData()
    }
    
    // MARK: - Protocol Methods
    
    func isSeenButtonWasTapped(on cell: MovieTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell),
              let movie = cell.movie else { return }
        
        movieController?.toggleIsSeen(for: movie)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    

}
