//
//  APICaller.swift
//  NetflixClone ProgrammaticUI
//
//  Created by Berkin Koca on 19.11.2023.
//

import Foundation

struct Constants {
     static let API_KEY = "?api_key=063a97b2f563fad5ba0aeefb03f1daa2"
     static let baseURL = "https://api.themoviedb.org"
}

enum APIError: Error {
     case failedToGetData
     
}

class APICaller {
     static let shared = APICaller()
     
     func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
          
          guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day\(Constants.API_KEY)") else { return }
          
          let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
               guard let data = data, error == nil else {
                    return
               }
               do {
                    let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                    completion(.success(results.results))
                    
               } catch {
                    completion(.failure(APIError.failedToGetData))
               }
          }
          task.resume()
     }
     
     func getTrendingTvs(completion: @escaping (Result<[Title], Error>) -> Void) {
          guard let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day\(Constants.API_KEY)") else { return }
          
          let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
               guard let data = data, error == nil else {
                    return
               }
               do {
                    let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                    print(results)
               } catch {
                    completion(.failure(APIError.failedToGetData))
               }
          }
          
          task.resume()
     }
     
     func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
          guard let url = URL(string: "\(Constants.baseURL)/3/movie/upcoming\(Constants.API_KEY)") else { return }
          
          let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
               guard let data = data, error == nil else {
                    return
               }
               do {
                    let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                    print(results)
               } catch {
                    completion(.failure(APIError.failedToGetData))
               }
          }
          
          task.resume()
     }
     
     func getPopular(completion: @escaping (Result<[Title], Error>) -> Void) {
          guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular\(Constants.API_KEY)") else { return }
          
          let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
               guard let data = data, error == nil else {
                    return
               }
               do {
                    let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                    print(results)
               } catch {
                    completion(.failure(APIError.failedToGetData))
               }
          }
          task.resume()
     }
     
     func getTopRated(completion: @escaping (Result<[Title], Error>) -> Void) {
          guard let url = URL(string: "\(Constants.baseURL)/3/movie/top_rated\(Constants.API_KEY)") else { return }
          
          let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
               guard let data = data, error == nil else {
                    return
               }
               do {
                    let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                    print(results)
               } catch {
                    completion(.failure(APIError.failedToGetData))
               }
          }
          task.resume()
     }
     
}


