//
//  MovieDetailViewController.swift
//  Flix
//
//  Created by Mikayla Orange on 2/16/21.
//

import UIKit
import AlamofireImage
class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var backdropImage: UIImageView!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    //    @IBOutlet weak var movieTitle: UILabel!
//    @IBOutlet weak var releaseDate: UILabel!
//    @IBOutlet weak var movieDescription: UILabel!
    var r: Movie!
    override func viewDidLoad() {
        super.viewDidLoad()
        backdropImage.af.setImage(withURL: r.backdropUrl!)
        posterImage.af.setImage(withURL: r.posterUrl!)
        movieTitle.text = r.title
        releaseDate.text = r.releaseDate
        movieDescription.text = r.overView
        movieDescription.numberOfLines = 0
        
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
