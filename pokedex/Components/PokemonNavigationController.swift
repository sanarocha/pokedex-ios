//
//  PokemonNavigationController.swift
//  pokedex
//
//  Created by Rossana Rocha on 28/07/22.
//

import UIKit

final class PokemonNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.delegate = self
    }

    private func setupView() {
        let font = UIFont.bold(ofSize: 24)
        let foregroundColor = UIColor.white
        self.navigationBar.titleTextAttributes = [
            .font: font,
            .foregroundColor: foregroundColor
        ]
        
        self.navigationBar.largeTitleTextAttributes = [
            .font: font,
            .foregroundColor: foregroundColor
        ]
        
        let backImage: UIImage? = UIImage(named: "backArrowIcon")
        self.navigationBar.backIndicatorImage = backImage
        self.navigationBar.backIndicatorTransitionMaskImage = backImage
        self.navigationBar.tintColor = .white
        
        self.view.backgroundColor = .white
        self.navigationItem.backBarButtonItem = UIBarButtonItem()
        self.navigationBar.backgroundColor = .clear
        UINavigationBar.appearance().shadowImage = UIImage()
    }
}

extension PokemonNavigationController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        viewController.navigationItem.backButtonTitle = ""
    }
}
