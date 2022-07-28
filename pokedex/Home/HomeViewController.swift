//
//  HomeViewController.swift
//  pokedex
//
//  Created by Rossana Rocha on 13/07/22.
//

import UIKit

final class HomeViewController: UIViewController {

    private lazy var  homeView: HomeView = {
        let view = HomeView()
        view.delegate = self
        return view
    }()

    // MARK: - Life Cycle
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

// MARK: - View Delegate
extension HomeViewController: HomeViewDelegate {
    
    func didSelectPokemonCell() {
        let viewController = PokemonViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
