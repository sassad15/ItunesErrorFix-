//
//  ItunesAPI.swift
//  ItunesApp729
//
//  Created by mac on 8/13/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation


struct ItunesAPI {
    
    //Song - https://itunes.apple.com/lookup?id=1125521386&entity=song
    //Album - https://itunes.apple.com/search?term=michael+jackson&entity=album
    
    var searchCriteria: (name: String?, album: Album?)

    init(search: String? = "", album: Album? = nil) {
        self.searchCriteria.name = search
        self.searchCriteria.album = album
    }
    
    let base = "https://itunes.apple.com/"
    let song = "lookup?id="
    let album = "search?term="
    let entity = "&entity="
   

    var getURL: URL? {
        let isSong = searchCriteria.album != nil
        switch isSong {
        case true:
            return URL(string: base + song + "\(searchCriteria.album!.id)" + entity + "song")
        case false:
            return URL(string: base + album + "\(searchCriteria.name!)" + entity + "album")
        }
    }
    
    
}
