//
//  MoviesGridViewController.swift
//  Flix
//
//  Created by Nathan Ireland on 10/23/19.
//  Copyright © 2019 Nathan Ireland. All rights reserved.
//

import UIKit
import AlamofireImage

class MoviesGridViewController: UIViewController, UICollectionViewDataSource,  UICollectionViewDelegate {
    
    
     var movies = [[String: Any]]()

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        retriveMovies()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        
        layout?.minimumLineSpacing = 5
        layout?.minimumInteritemSpacing = 5
        let width = (view.frame.size.width - layout!.minimumInteritemSpacing * 2) / 3
        layout?.itemSize = CGSize(width: width, height: width * 3 / 2)
        


        // Do any additional setup after loading the view.
    }
    
    
    func retriveMovies(){
         let url = URL(string: "https://api.themoviedb.org/3/movie/297762/similar?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US&page=1")!
         let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
         let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
         let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
               print(error.localizedDescription)
            } else if let data = data {
               let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]

               // TODO: Get the array of movies
               // TODO: Store the movies in a property to use elsewhere
             self.movies = dataDictionary["results"] as! [[String: Any]]
               // TODO: Reload your table view data
                
                self.collectionView.reloadData()
                print(self.movies)
             

            }
         }
         task.resume()
     }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieGridCell", for: indexPath) as! MovieGridCell
        
        let movie = movies[indexPath.item]
        
         let baseURL = "https://image.tmdb.org/t/p/w185"
         let posterPath = movie["poster_path"] as! String
         let posterURL = URL(string: baseURL + posterPath)
               
        cell.posterView.af_setImage(withURL: posterURL!)
        
        return cell
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
               let cell = sender as! UICollectionViewCell
               let indexPath = collectionView.indexPath(for: cell)!
               let movie = movies[indexPath.item]
               // Pass the selected object to the new view controller.
        let detailsGridViewControlller = segue.destination as! MoviesViewController;
        
        detailsGridViewControlller.movie = movie
        
               collectionView.deselectItem(at: indexPath, animated: true)
    }
    

}
