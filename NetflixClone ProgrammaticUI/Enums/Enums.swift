//
//  Enums.swift
//  NetflixClone ProgrammaticUI
//
//  Created by Berkin Koca on 21.11.2023.
//

import Foundation

enum Sections: Int {
     case TrendingMovies = 0
     case TrendingTv = 1
     case Popular = 2
     case Upcoming = 3
     case TopRated = 4
}

enum APIError: Error {
     case failedToGetData
     
}

