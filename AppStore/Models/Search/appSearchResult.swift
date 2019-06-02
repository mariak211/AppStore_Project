//
//  appSearchResult.swift
//  AppStore
//
//  Created by Mariak Achuoth on 2019-05-18.
//  Copyright © 2019 The Future I Dream. All rights reserved.
//


struct SearchResult: Decodable{
    let resultCount : Int
    let results: [Result]
}

struct Result: Decodable{
    let trackName: String
    let primaryGenreName: String
    let averageUserRating: Float?
    let screenshotUrls: [String]
    let artworkUrl100: String
}
