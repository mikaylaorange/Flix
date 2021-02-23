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
    var moviesArray: [Movie] = []
    
    
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
        cell.r = movie
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let cell = sender as! UITableViewCell
            if let indexPath = tableView.indexPath(for: cell) {
                let r = moviesArray[indexPath.row]
                let detailViewController = segue.destination as! MovieDetailViewController
                detailViewController.r = r
        }
    }
    
    
    
    
}

