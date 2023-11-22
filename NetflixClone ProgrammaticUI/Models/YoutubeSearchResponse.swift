//
//  YoutubeSearchResponse.swift
//  NetflixClone ProgrammaticUI
//
//  Created by Berkin Koca on 22.11.2023.
//

import Foundation

struct YoutubeSearchResponse: Codable {
     
     let items: [VideoElement]
}

struct VideoElement: Codable {
     let id: IdVideoElement
}

struct IdVideoElement: Codable {
     let kind: String
     let videoId: String
}
