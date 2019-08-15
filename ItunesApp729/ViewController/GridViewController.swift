//
//  GridViewController.swift
//  ItunesApp729
//
//  Created by mac on 8/13/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class GridViewController: UIViewController {

    @IBOutlet weak var gridCollectionView: UICollectionView!
    
    //Dependency Injection - Give an object its dependency from the outside

    var viewModel = ViewModel() {
        didSet {
            gridCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGrid()
    }
    
    
    private func setupGrid() {
        
        NotificationCenter.default.addObserver(forName: Notification.Name("VMNote"), object: nil, queue: .main) { note in
            let userInfo = note.userInfo!
            guard let vModel = userInfo["vm"] as? ViewModel else {
                return
            }
            self.viewModel = vModel
        }
    }

  

}

extension GridViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.albums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCollectionCell.identifier, for: indexPath) as! AlbumCollectionCell
        let album = viewModel.albums[indexPath.row]
        cell.album = album
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width / 3
        return CGSize(width: width, height: 134)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let album = viewModel.albums[indexPath.row]
        //TODO: NEED the view model
    }

}
