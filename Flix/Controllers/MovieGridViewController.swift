//
//  MovieGridViewController.swift
//  Flix
//
//  Created by Mikayla Orange on 2/22/21.
//

import UIKit

class MovieGridViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate   {
    
    
    var moviesArray: [Movie] = []
    @IBOutlet weak var collectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        getAPIData()
        collectionView.delegate = self
        collectionView.dataSource = self
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 0
        let width = (view.frame.size.width - layout.minimumInteritemSpacing * 2) / 3
        layout.itemSize = CGSize(width: width, height: width *  3 / 2)
        // Do any additional setup after loading the view.
    }
    func getAPIData() {
        SuperheroAPI.getAPI() { (movies) in
            guard let movies = movies else {
                return
            }
            self.moviesArray = movies
            self.collectionView.reloadData()
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return  moviesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieGridCell",for: indexPath) as! MovieGridCell
        let movie = moviesArray[indexPath.item]
        cell.r = movie
        return cell
    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return moviesArray.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
//        let movie = moviesArray[indexPath.row]
//        cell.r = movie
//        return cell
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            let cell = sender as! UITableViewCell
//            if let indexPath = tableView.indexPath(for: cell) {
//                let r = moviesArray[indexPath.row]
//                let detailViewController = segue.destination as! MovieDetailViewController
//                detailViewController.r = r
//        }
//    }
//

        // Do any additional setup after loading the view.
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
