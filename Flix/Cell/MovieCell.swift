//
//  MovieCell.swift
//  Flix
//
//  Created by Mikayla Orange on 2/9/21.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet var movieImage: UIImageView!
    @IBOutlet var movieTitle: UILabel!
    @IBOutlet var movieDescription: UILabel!
    
    var r: Movie! {
        didSet {
            movieTitle.text = r.title
            movieDescription.text = r.overView
            movieImage.af.setImage(withURL: r.posterUrl!)
            movieImage.layer.cornerRadius = 10
            movieImage.clipsToBounds = true
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
