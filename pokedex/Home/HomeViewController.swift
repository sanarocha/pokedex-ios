//
//  HomeViewController.swift
//  pokedex
//
//  Created by Rossana Rocha on 13/07/22.
//

import UIKit

final class HomeViewController: UIViewController {

    private let homeView = HomeView()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = homeView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
}
