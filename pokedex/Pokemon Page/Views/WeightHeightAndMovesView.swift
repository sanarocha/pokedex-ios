//
//  WeightHeightAndMovesView.swift
//  pokedex
//
//  Created by Rossana Rocha on 12/08/22.
//

import UIKit

final class WeightHeightAndMovesView: UIView {
    
    // MARK: - Properties
    private let weightLabel: UILabel = {
        let label = UILabel()
        label.text = "Weight"
        label.font = .regular(ofSize: 10)
        label.textColor = .mediumGray
        label.textAlignment = .center
        return label
    }()
    
    private let weightIconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "scaleIcon")?.withTintColor(.darkGray)
        return imageView
    }()
    
    private let pokemonWeightLabel: UILabel = {
        let label = UILabel()
        label.text = "0.0 kg"
        label.font = .regular(ofSize: 12)
        label.textColor = .darkGray
        return label
    }()
    
    private let dividerLine: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private let heightLabel: UILabel = {
        let label = UILabel()
        label.text = "Height"
        label.font = .regular(ofSize: 10)
        label.textColor = .mediumGray
        label.textAlignment = .center
        return label
    }()
    
    private let heightIconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "rulerIcon")?.withTintColor(.darkGray)
        return imageView
    }()
    
    private let pokemonHeightLabel: UILabel = {
        let label = UILabel()
        label.text = "0.5 m"
        label.font = .regular(ofSize: 12)
        label.textColor = .darkGray
        return label
    }()
    
    private let secondDivisoryLine: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    
    private let movesLabel: UILabel = {
        let label = UILabel()
        label.text = "Moves"
        label.font = .regular(ofSize: 10)
        label.textColor = .mediumGray
        label.textAlignment = .center
        return label
    }()
    
    private let pokemonMovesLabel: UILabel = {
        let label = UILabel()
        label.text = """
        Dough
        Donuts
        """
        label.font = .regular(ofSize: 12)
        label.textColor = .darkGray
        label.numberOfLines = 2
        return label
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
}

// MARK: - Layout
extension WeightHeightAndMovesView {
    
    private func setupLayout() {
        self.backgroundColor = .clear
        setupWeightIcon()
        setupPokemonWeightLabel()
        setupDivisoryLine()
        setupWeigthLabel()
        setupHeightIcon()
        setupPokemonHeightLabel()
        setupSecondDivisoryLine()
        setupHeightLabel()
        setupPokemonMovesLabel()
        setupMovesLabel()
    }
    
    private func setupWeightIcon() {
        self.addSubview(weightIconImage)
        
        weightIconImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(13)
            make.leading.equalToSuperview().offset(10)
            make.size.equalTo(17)
        }
    }
    
    private func setupPokemonWeightLabel() {
        self.addSubview(pokemonWeightLabel)
        
        pokemonWeightLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalTo(weightIconImage.snp.trailing).offset(8)
            make.centerY.equalTo(weightIconImage)
        }
    }
    
    private func setupDivisoryLine() {
        self.addSubview(dividerLine)
        
        dividerLine.snp.makeConstraints { make in
            make.leading.equalTo(pokemonWeightLabel.snp.trailing).offset(24)
            make.bottom.top.equalToSuperview()
            make.width.equalTo(1)
        }
    }
    
    private func setupWeigthLabel() {
        self.addSubview(weightLabel)
        
        weightLabel.snp.makeConstraints { make in
            make.top.equalTo(pokemonWeightLabel.snp.bottom).offset(10)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalTo(dividerLine.snp.leading).offset(-24)
        }
    }
    
    private func setupHeightIcon() {
        self.addSubview(heightIconImage)
        
        heightIconImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalTo(dividerLine.snp.trailing).offset(24)
            make.centerY.equalTo(pokemonWeightLabel)
            make.width.equalTo(9)
        }
    }
    
    private func setupPokemonHeightLabel() {
        self.addSubview(pokemonHeightLabel)
        
        pokemonHeightLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalTo(heightIconImage.snp.trailing).offset(8)
            make.centerY.equalTo(heightIconImage)
        }
    }
    
    private func setupSecondDivisoryLine() {
        self.addSubview(secondDivisoryLine)
        
        secondDivisoryLine.snp.makeConstraints { make in
            make.leading.equalTo(pokemonHeightLabel.snp.trailing).offset(24)
            make.top.bottom.equalToSuperview()
            make.width.equalTo(1)
        }
    }
    
    private func setupHeightLabel() {
        self.addSubview(heightLabel)
        
        heightLabel.snp.makeConstraints { make in
            make.top.equalTo(pokemonHeightLabel.snp.bottom).offset(10)
            make.leading.equalTo(dividerLine.snp.trailing).offset(24)
            make.trailing.equalTo(secondDivisoryLine.snp.leading).offset(-24)
            make.bottom.equalToSuperview()
        }
    }
    
    private func setupPokemonMovesLabel() {
        self.addSubview(pokemonMovesLabel)
        
        pokemonMovesLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalTo(secondDivisoryLine.snp.trailing).offset(24)
            make.trailing.equalToSuperview()
        }
    }
    
    private func setupMovesLabel() {
        self.addSubview(movesLabel)
        
        movesLabel.snp.makeConstraints { make in
            make.top.equalTo(pokemonMovesLabel.snp.bottom).offset(4)
            make.leading.equalTo(secondDivisoryLine.snp.trailing).offset(24)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
