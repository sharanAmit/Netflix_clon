//
//  APICaller.swift
//  Netflix_clone
//
//  Created by Amit Sharan on 13/02/23.
//

import Foundation


struct Constant{
    static let APIkey = "40fb7057f5c19ea410ba0f884ce9068f"
    static let baseURL = "https://api.themoviedb.org"
}

class APICAller{
    static let shared = APICAller()
    
    func getTrendingMovies(completion: @escaping (String) -> Void){
        guard let url = URL(string: "\(Constant.baseURL)/3/trending/all/day?api_key=\(Constant.APIkey)") else {
            return
            
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){data, _, error in guard let data = data, error == nil else {
            return
        }
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                print(results)
            } catch {
                print(error.localizedDescription)
            }
            
        }
        task.resume()
    }
}




































