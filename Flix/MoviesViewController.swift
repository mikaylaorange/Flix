//
//  ViewController.swift
//  Flix
//
//  Created by Mikayla Orange on 2/7/21.
//

import UIKit
import AlamofireImage

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    var moviesArray: [[String:Any?]] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
    	tableView.dataSource = self
        getAPIData()
        // Do any additional setup after loading the view.
    }
    func getAPIData() {
            API.getAPI() { (movies) in
                guard let movies = movies else {
                    return
                }
                self.moviesArray = movies
                self.tableView.reloadData()
            }
        }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
                let movie = moviesArray[indexPath.row]
        		print(movie["poster_path"] as? String ?? "")
                cell.movieTitle.text = movie["title"] as? String ?? ""
        		cell.movieDescription.text = movie["overview"] as? String ?? ""
        if let imageUrlString = movie["poster_path"] as? String {
            let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500" + imageUrlString)
            print(imageUrlString)
            cell.movieImage.af.setImage(withURL: imageUrl!)
        }
        else {
           // No poster image. Can either set to nil (no image) or a default movie poster image
           // that you include as an asset
           cell.movieImage.image = nil
        }
                return cell
            }
        


}

