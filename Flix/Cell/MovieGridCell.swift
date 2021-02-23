//
//  MovieGridCell.swift
//  Flix
//
//  Created by Mikayla Orange on 2/22/21.
//

import UIKit

class MovieGridCell: UICollectionViewCell {
    @IBOutlet weak var posterView: UIImageView!
    var r: Movie! {
        didSet {
            posterView.af.setImage(withURL: r.posterUrl!)
            posterView.layer.cornerRadius = 10
            posterView.clipsToBounds = true
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
