//
//  MovieTableViewCell.swift
//  Movie List
//
//  Created by Lisa Sampson on 4/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

protocol MovieTableViewCellDelegate: AnyObject {
    func isSeenButtonWasTapped(on cell: MovieTableViewCell)
}

class MovieTableViewCell: UITableViewCell {

    // MARK: - Properties and Outlets
    weak var delegate: MovieTableViewCellDelegate?
    var movie: Movie? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var movieLabel: UILabel!
    @IBOutlet weak var isSeenButton: UIButton!
    
    // MARK: - Methods
    func updateViews() {
        guard let movie = movie else { return }
        
        if movie.isSeen == false {
            isSeenButton.setTitle("Not Seen", for: .normal)
        } else {
            isSeenButton.setTitle("Seen", for: .normal)
        }
        
        movieLabel.text = movie.movie
    }
    
    @IBAction func isSeenButtonWasTapped(_ sender: Any) {
        delegate?.isSeenButtonWasTapped(on: self)
    }
    
}
