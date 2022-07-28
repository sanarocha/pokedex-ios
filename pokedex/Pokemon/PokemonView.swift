//
//  PokemonView.swift
//  pokedex
//
//  Created by Rossana Rocha on 28/07/22.
//

import UIKit

final class PokemonView: UIView {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .bold(ofSize: 24)
        label.textColor = .white
        label.text = "Pokemon"
        return label
    }()
    
    private let idLabel: UILabel = {
        let label = UILabel()
        label.font = .regular(ofSize: 12)
        label.textColor = .white
        label.text = "#000"
        return label
    }()
    
    private let opaquePokeballImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pokeballIcon")?.withTintColor(.white.withAlphaComponent(0.2))
        return imageView
    }()
    
    private let pokemonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "charmanderImage")
        return imageView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()

    // MARK: - Init
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .background
        self.setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        updateOpaquePokeballSize()
    }
}

// MARK: - Actions
extension PokemonView {
    
    private func updateOpaquePokeballSize() {
        let adaptiveSize = self.bounds.size.height / 3.8
        
        opaquePokeballImageView.snp.remakeConstraints { make in
            make.top.equalToSuperview().offset(44)
            make.trailing.equalToSuperview().offset(-16)
            make.size.equalTo(adaptiveSize)
        }
    }
}

// MARK: - Layout
extension PokemonView {
    
    private func setupLayout() {
        self.backgroundColor = .red
        setupNameLabel()
        setupIdLabel()
        setupOpaquePokeballImageView()
        setupContentView()
        setupPokemonImageView()
    }
    
    private func setupNameLabel() {
        self.addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(58)
            make.leading.equalToSuperview().offset(40)
        }
    }
    
    private func setupIdLabel() {
        self.addSubview(idLabel)
        
        idLabel.snp.makeConstraints { make in
            make.centerY.equalTo(nameLabel)
            make.trailing.equalToSuperview().offset(-24)
        }
    }
    
    private func setupOpaquePokeballImageView() {
        self.addSubview(opaquePokeballImageView)
        
        opaquePokeballImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(44)
            make.trailing.equalToSuperview().offset(-16)
        }
    }
    
    private func setupContentView() {
        self.addSubview(contentView)
        
        contentView.snp.makeConstraints { make in
            make.top.equalTo(opaquePokeballImageView.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview().inset(6)
            make.bottom.equalToSuperview().offset(-28)
        }
    }
    
    private func setupPokemonImageView() {
        self.addSubview(pokemonImageView)
        
        pokemonImageView.snp.makeConstraints { make in
            make.bottom.equalTo(contentView.snp.top).offset(56)
            make.centerX.equalTo(contentView)
            make.size.equalTo(200)
        }
    }
}
