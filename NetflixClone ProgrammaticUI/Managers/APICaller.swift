//
//  APICaller.swift
//  NetflixClone ProgrammaticUI
//
//  Created by Berkin Koca on 19.11.2023.
//

import Foundation


class APICaller: APICallerProtocol {
     static let shared = APICaller()
     
     private init(){
          
     }
     
     func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
          
          //type alias'la yap.
          //@escaping yerine asyn await kullanılabilir
          //Protocollere ayır
          //Dependency Injection -> View'a yap.
          //Mock'u Inject ederek çalıştırmayı dene.
          
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
                    completion(.success(results.results))
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
                    completion(.success(results.results))
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
                    completion(.success(results.results))
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
                    completion(.success(results.results))
               } catch {
                    completion(.failure(APIError.failedToGetData))
               }
          }
          task.resume()
     }
     
     func getDiscoveredMovies(completion: @escaping (Result<[Title], Error>) -> Void ) {
          
          guard let url = URL(string: "\(Constants.baseURL)/3/discover/movie\(Constants.API_KEY)") else { return }
          
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
}


