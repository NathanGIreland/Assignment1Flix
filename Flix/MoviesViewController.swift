//
//  MoviesViewController.swift
//  Flix
//
//  Created by Nathan Ireland on 10/23/19.
//  Copyright © 2019 Nathan Ireland. All rights reserved.
//

import UIKit
import AlamofireImage

class MoviesViewController: UIViewController {
    
    @IBOutlet weak var BackdropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var synView: UILabel!
    
    
    var movie: [String:Any]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleView.text = movie["title"] as? String
        synView.text = movie["overview"] as? String
        
        let baseURL = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterURL = URL(string: baseURL + posterPath)
        
        posterView.af_setImage(withURL: posterURL!)
        
        let backdropPath = movie["backdrop_path"] as! String
        let backdropURL = URL(string: "https://image.tmdb.org/t/p/w780" + backdropPath)
        
        BackdropView.af_setImage(withURL: backdropURL!)


        
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
