//
//  Track.swift
//  ItunesApp729
//
//  Created by mac on 8/14/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

struct TrackResponse: Decodable {
    let results: [Track]
    
}

class Track: Decodable {
    
    let trackCount: Int?
    let artistName: String?
    let trackViewUrl: String?
    let trackTimeMillis: Int?
    let price: Double?
    
    // Enum: Associated value or raw value
    private enum CodingKeys: String, CodingKey {
        case trackCount
        case artistName
        case trackViewUrl
        case trackTimeMillis
        case price = "trackPrice"
    }
    
    
}
