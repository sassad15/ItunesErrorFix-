//
//  ItunesService.swift
//  ItunesApp729
//
//  Created by mac on 8/13/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

typealias AlbumHandler = ([Album]) -> Void
typealias TrackHandler = ([Track]) -> Void


let service = ItunesService.shared

final class ItunesService {
    
    static let shared = ItunesService()
    private init() {}
    
    
    func getAlbums(for search: String, completion: @escaping AlbumHandler) {
        
        guard let url = ItunesAPI(search: search).getURL else {
            completion([])
            return
        }
        
        URLSession.shared.dataTask(with: url) { (dat, _, err) in
            
            if let error = err {
                print(error.localizedDescription)
                completion([])
                return
            }
            
            if let data = dat {
                do {
                    let albumResponse = try JSONDecoder().decode(AlbumResponse.self, from: data)
                    let albums = albumResponse.results
                    completion(albums)
                } catch {
                    print(error.localizedDescription)
                    completion([])
                    return
                }
            }
        }.resume()
    }
    
    
    func getTracks(for album: Album, completion: @escaping TrackHandler) {
        
        guard let url = ItunesAPI(album: album).getURL else {
            completion([])
            return
        }
        
        URLSession.shared.dataTask(with: url) { (dat, _, err) in
            
            if let error = err {
                print(error.localizedDescription)
                completion([])
                return
            }
            
            if let data = dat {
                do {
                    let trackResponse = try JSONDecoder().decode(TrackResponse.self, from: data)
                    let tracks = trackResponse.results
                    completion(Array(tracks.suffix(from:1)))
                } catch {
                    print(error.localizedDescription)
                    completion([])
                    return
                }
            }
        }.resume()
    
    }
    
    
    
    
    
}
