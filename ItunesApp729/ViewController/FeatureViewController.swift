//
//  ViewController.swift
//  ItunesApp729
//
//  Created by mac on 8/13/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class FeatureViewController: UIViewController {
    
    @IBOutlet weak var gridContainerView: UIView!
    @IBOutlet weak var listContainerView: UIView!
    
    
    var type: String {
        return gridContainerView.isHidden ? "ListView" : "GridView"
    }
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var viewModel: ViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFeature()
    }

    
    @IBAction func editButtonTapped(_ sender: UIBarButtonItem) {
        
        gridContainerView.isHidden.toggle()
        listContainerView.isHidden.toggle()
        
        title = type
    }
    
    
    private func setupFeature() {
        definesPresentationContext = true
        title = type
        
        searchController.searchBar.delegate = self
        searchController.dimsBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        viewModel = ViewModel()
        
    }
    
    
}

extension FeatureViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let sanitizedSearch = searchBar.text?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        
        viewModel.get(with: sanitizedSearch)
    }
}
