//
//  APICaller.swift
//  NetflixClone ProgrammaticUI
//
//  Created by Berkin Koca on 19.11.2023.
//

import Foundation

struct Constants {
     static let API_KEY = "063a97b2f563fad5ba0aeefb03f1daa2"
     static let baseURL = "https://api.themoviedb.org"
}

enum APIError: Error {
     case failedToGetData
     
}

class APICaller {
     static let shared = APICaller()
     
     func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
          
          guard let url = URL(string: "\(Constants.baseURL)/3/trending/all/day?api_key=\(Constants.API_KEY)") else { return }
          
          let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
               guard let data = data, error == nil else {
                    return
               }
               do {
                    let results = try JSONDecoder().decode(TrendingMovieResponse.self, from: data)
                    completion(.success(results.results))
                    
               } catch {
                    completion(.failure(error))
               }
          }
          task.resume()
     }
}


