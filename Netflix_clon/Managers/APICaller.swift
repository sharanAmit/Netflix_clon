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

enum APIError: Error {
    case failedTogetData
}

class APICaller{
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string: "\(Constant.baseURL)/3/trending/all/day?api_key=\(Constant.APIkey)") else {
            return
            
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){data, _, error in guard let data = data, error == nil else {
            return
        }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                print("this is result" , results)
                completion(.success(results.results))
            } catch {
                print("this is error" , error.localizedDescription)
                completion(.failure(APIError.failedTogetData))
            }
            
        }
        task.resume()
    }
    
    func getTrendingTv(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url  = URL(string: "\(Constant.baseURL)/3/trending/tv/day?api_key=\(Constant.APIkey)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do {let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                print("this is result" , results)
            }
            catch {
                completion(.failure(APIError.failedTogetData))
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    
//    https://api.themoviedb.org/3/movie/upcoming?api_key=<<api_key>>&language=en-US&page=1
    func getUpcomingMovie(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url  = URL(string: "\(Constant.baseURL)/3/movie/upcoming?api_key=\(Constant.APIkey)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do {let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                print("this is result" , results)
            }
            catch {
                completion(.failure(APIError.failedTogetData))
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
//    https://api.themoviedb.org/3/movie/popular?api_key=<<api_key>>&language=en-US&page=1
    func getPopular(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url  = URL(string: "\(Constant.baseURL)/3/movie/popular?api_key=\(Constant.APIkey)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do {let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                print("this is result" , results)
            }
            catch {
                completion(.failure(APIError.failedTogetData))
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
//    https://api.themoviedb.org/3/movie/top_rated?api_key=<<api_key>>&language=en-US&page=1
    
    
    func getTopRated(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url  = URL(string: "\(Constant.baseURL)/3/movie/top_rated?api_key=\(Constant.APIkey)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do {let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                print("this is result" , results)
            }
            catch {
                completion(.failure(APIError.failedTogetData))
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
}
