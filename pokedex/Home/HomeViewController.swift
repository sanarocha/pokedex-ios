//
//  HomeViewController.swift
//  pokedex
//
//  Created by Rossana Rocha on 13/07/22.
//

import UIKit

final class HomeViewController: UIViewController {

    private let homeView = HomeView()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = homeView
    }
}
