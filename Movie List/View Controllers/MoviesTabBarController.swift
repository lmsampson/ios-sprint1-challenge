//
//  MoviesTabBarController.swift
//  Movie List
//
//  Created by Lisa Sampson on 4/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class MoviesTabBarController: UITabBarController {
    
    // MARK: - Properties
    
    let movieController = MovieController()

    // MARK: - View loading and Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passMovieControllerToChildViewControllers()
    }
    
    func passMovieControllerToChildViewControllers() {
        for childVC in children {
            if let childVC = childVC as? MovieControllerProtocol {
                childVC.movieController = movieController
            }
        }
    }
}
