//
//  ViewModel.swift
//  ItunesApp729
//
//  Created by mac on 8/14/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation


class ViewModel {
    
    /* ViewModel
    1. Business Logic
    2. Service Calls
    3. Data
    */
    
    var albums = [Album]() {
        didSet {
            let userInfo = ["vm":self]
            NotificationCenter.default.post(name: Notification.Name("VMNote"), object: nil, userInfo: userInfo)
        }
        
    }
    
    var tracks = [Track]() {
        didSet {
            let userInfo = ["vm":self]
            NotificationCenter.default.post(name: Notification.Name("VMNote"), object: nil, userInfo: userInfo)
        }
    }
    
    
    func get(with search: String) {
        
        service.getAlbums(for: search ) { albms in
            self.albums = albms
            print("Album Count: \(albms.count)")
        }
    }
    
    func get(album: Album) {
        service.getTracks(for: album) { trks in
            print("Track Count: \(trks.count)")
        }
    }
    
}
