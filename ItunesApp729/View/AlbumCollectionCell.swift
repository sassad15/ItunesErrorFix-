//
//  AlbumCollectionCell.swift
//  ItunesApp729
//
//  Created by mac on 8/13/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class AlbumCollectionCell: UICollectionViewCell {
    
    var album: Album! {
        didSet {
            albumLabel.text = album.name
            
            guard let url = URL(string: album.imageUrl) else {
                //TODO: Set Default Image - Placeholder
                return
            }
            
            //To download images - you must use a URLSession
            URLSession.shared.dataTask(with: url) { [weak self] (dat, _, _) in
                if let data = dat {
                    
                    let image = UIImage(data: data)
                    
                    DispatchQueue.main.async {
                        self?.albumImage.image = image
                    }
                }
            }.resume()
    
        }
    }
    
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var albumLabel: UILabel!
    
    static let identifier = "AlbumCollectionCell"
}
