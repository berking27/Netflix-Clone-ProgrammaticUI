//
//  APICallerProtocol.swift
//  NetflixClone ProgrammaticUI
//
//  Created by Berkin Koca on 21.11.2023.
//

import Foundation


protocol APICallerProtocol {
     
     func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void)
     
     func getTrendingTvs(completion: @escaping (Result<[Title], Error>) -> Void)
     
     func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void)
     
     func getPopular(completion: @escaping (Result<[Title], Error>) -> Void)
     
     func getTopRated(completion: @escaping (Result<[Title], Error>) -> Void)
     
     func getDiscoveredMovies(completion: @escaping (Result<[Title], Error>) -> Void )
     
     func search(with query: String, completion: @escaping (Result<[Title], Error>) -> Void )
}
