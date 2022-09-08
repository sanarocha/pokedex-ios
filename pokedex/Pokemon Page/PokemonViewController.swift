//
//  PokemonViewController.swift
//  pokedex
//
//  Created by Rossana Rocha on 28/07/22.
//

import UIKit

final class PokemonViewController: UIViewController {

    private let pokemonView = PokemonView()

    // MARK: - Life Cycle
    override func loadView() {
        self.view = pokemonView
    }
}
