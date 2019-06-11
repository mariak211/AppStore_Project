//
//  Appshorizontal.swift
//  AppStore
//
//  Created by Mariak Achuoth on 2019-05-31.
//  Copyright © 2019 The Future I Dream. All rights reserved.
//

import Foundation


struct appsGroup: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
     let title: String
    let results: [FeedResult]
    
}
struct FeedResult: Decodable {
    let id: String
    let name: String
    let artistName: String
    let artworkUrl100: String
    
}
