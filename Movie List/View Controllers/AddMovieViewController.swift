//
//  AddMovieViewController.swift
//  Movie List
//
//  Created by Lisa Sampson on 4/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class AddMovieViewController: UIViewController, MovieControllerProtocol {
    
    // MARK: - Properties and Outlets
    
    var movieController: MovieController?
    @IBOutlet weak var movieTextField: UITextField!
    
    // MARK: - View loading and action Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addMovieButtonWasTapped(_ sender: Any) {
        guard let movie = movieTextField.text else { return }
        
        movieController?.createMovie(withName: movie)
        
        movieTextField.text = ""
    }
    
    

}
