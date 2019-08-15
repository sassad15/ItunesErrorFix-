//
//  AlbumTableCell.swift
//  ItunesApp729
//
//  Created by mac on 8/13/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class AlbumTableCell: UITableViewCell {
    
    var album: Album! {
        didSet {
            albumMainLabel.text = album.name
            albumSubLabel.text = album.artistName
            
            guard let url = URL(string: album.imageUrl) else {
                return
            }
            URLSession.shared.dataTask(with: url) { [weak self] (dat, _, err) in
                if let _ = err {
                    return
                }
                
                if let data = dat {
                    DispatchQueue.main.async {
                        self?.albumImage.image = UIImage(data: data)
                    }
                }
                
                }.resume()
        }
    }

    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var albumMainLabel: UILabel!
    @IBOutlet weak var albumSubLabel: UILabel!
    
    static let identifier = "AlbumTableCell"
}
