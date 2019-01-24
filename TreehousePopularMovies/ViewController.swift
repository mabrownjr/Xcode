//
//  ViewController.swift
//  TreehousePopularMovies
//
//  Created by Michael Brown on 1/24/19.
//  Copyright © 2019 Michael Brown. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    // 
    final let url = URL(string: "https://api.themoviedb.org/3/movie/550?api_key=c3df1ec1d614f1f10ffb71cd1cb8a112")
    private var movies = [Movie]()
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchJSON()
    }
    
    // Function that grabs the JSON data
    func fetchJSON (){
        
        // Starting the networking session via URL
        guard let downloadURL = url else { return }
        URLSession.shared.dataTask(with: downloadURL) { (data, urlResponse, error) in
            guard let dataResponse = data, error == nil, urlResponse != nil else {
                // Test if the data is not empty and has downloaded, print "Downloaded"
                print("something is wrong")
                return
            }
            print("Downloaded")
             // check for data response from the network request
            do {
                let decoder = JSONDecoder()
                
                //
                let downloadedResults = try decoder.decode(Results.self, from: dataResponse)
                self.movies = downloadedResults.results
                DispatchQueue.main.async {
                      self.tableView.reloadData()
                }
              
            }catch {
                print("Something wrong after downloading")
            }
            
            
        }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as? PopularMovieCell else { return UITableViewCell()}
        
        cell.titleLabel.text = movies[indexPath.row].title
        cell.releaseDateLabel.text = movies[indexPath.row].release_date
        
        return cell
    }


}

