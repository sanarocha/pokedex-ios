//
//  PokedexHeaderView.swift
//  pokedex
//
//  Created by Rossana Rocha on 15/07/22.
//

import UIKit

final class PokedexHeaderView: UICollectionReusableView {
    
    private let pokeballLogoIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pokeballIcon")
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Pokédex"
        label.font = .bold(ofSize: 24)
        label.textColor = .darkGray
        return label
    }()
    
    private let filterButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "sortByNumberIcon"), for: .normal)
        button.backgroundColor = .clear
        return button
    }()
        
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search"
        searchBar.barStyle = .default
        searchBar.backgroundImage = UIImage()
        searchBar.searchTextField.textColor = .mediumGray
        searchBar.searchTextField.backgroundColor = .white
        searchBar.searchTextField.layer.borderColor = UIColor.lightGray.cgColor
        searchBar.searchTextField.layer.borderWidth = 0.5
        searchBar.searchTextField.layer.cornerRadius = 8
        searchBar.searchTextField.clipsToBounds = true
        return searchBar
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: .null)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Layout
extension PokedexHeaderView {
    
    private func setupLayout() {
        setupPokeballLogoIcon()
        setupTitleLabel()
        setupFilterButton()
        setupSearchBar()
    }
    
    private func setupPokeballLogoIcon() {
        self.addSubview(pokeballLogoIcon)
        
        pokeballLogoIcon.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(28)
            make.leading.equalToSuperview().offset(8)
            make.size.equalTo(24)
        }
    }
    
    private func setupTitleLabel() {
        self.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(pokeballLogoIcon.snp.trailing).offset(16)
            make.centerY.equalTo(pokeballLogoIcon)
        }
    }
    
    private func setupFilterButton() {
        self.addSubview(filterButton)
        
        filterButton.snp.makeConstraints { make in
            make.height.equalTo(32)
            make.width.equalTo(20)
            make.trailing.equalToSuperview().offset(-8)
            make.centerY.equalTo(pokeballLogoIcon)
        }
    }
    
    private func setupSearchBar() {
        self.addSubview(searchBar)
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(-6)
            make.trailing.equalToSuperview().offset(6)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
}
