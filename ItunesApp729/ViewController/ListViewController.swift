//
//  ListViewController.swift
//  ItunesApp729
//
//  Created by mac on 8/13/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    @IBOutlet weak var listTableView: UITableView!
    
   

    var viewModel = ViewModel() {
        didSet {
            listTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupList()
    }
    
    private func setupList() {
        
        NotificationCenter.default.addObserver(forName: Notification.Name("VMNote"), object: nil, queue: .main) { note in
            let userInfo = note.userInfo!
            guard let vModel = userInfo["vm"] as? ViewModel else {
                return
            }
            self.viewModel = vModel
        }
    }
    

}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AlbumTableCell.identifier, for: indexPath) as! AlbumTableCell
        let album = viewModel.albums[indexPath.row]
        cell.album = album
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let albm = viewModel.albums[indexPath.row]
        viewModel.get(album: albm)
    }
    

}
