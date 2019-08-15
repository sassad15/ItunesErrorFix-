//
//  Album.swift
//  ItunesApp729
//
//  Created by mac on 8/13/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

struct AlbumResponse: Decodable {
    let results: [Album]
}

class Album: Decodable {
    
    let id: Int
    let artistName: String
    let name: String
    let imageUrl: String
    let price: Double
    let trackCount: Int
    let releaseDate: String
    let genre: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "collectionId"
        case artistName
        case name = "collectionName"
        case imageUrl = "artworkUrl100"
        case price = "collectionPrice"
        case trackCount
        case releaseDate
        case genre = "primaryGenreName"
    }
    
}
