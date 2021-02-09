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
    override func awakeFromNib() {
        super.awakeFromNib()
        movieImage.contentMode = .scaleAspectFit
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
