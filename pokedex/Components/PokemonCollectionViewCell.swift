//
//  PokemonCollectionViewCell.swift
//  pokedex
//
//  Created by Rossana Rocha on 13/07/22.
//

import UIKit
import SnapKit

final class PokemonCollectionViewCell: UICollectionViewCell {
    
    private let idLabel: UILabel = {
        let label = UILabel()
        label.text = "#000"
        label.textAlignment = .right
        label.font = .regular(ofSize: 8)
        label.textColor = .fire
        return label
    }()
    
    private let avatarImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "charmanderImage")
        image.contentMode = .scaleToFill
        return image
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Pokemon"
        label.textAlignment = .center
        label.font = .regular(ofSize: 10)
        label.backgroundColor = .fire
        label.textColor = .white
        label.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        label.layer.cornerRadius = 8
        label.clipsToBounds = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Layout
extension PokemonCollectionViewCell {

    private func setupLayout() {
        self.layer.borderColor = UIColor.fire.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 8
        self.contentView.addSubview(idLabel)
        self.contentView.addSubview(avatarImageView)
        self.contentView.addSubview(nameLabel)
        
        idLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.leading.trailing.equalToSuperview().inset(8)
        }
        
        avatarImageView.snp.makeConstraints { make in
            make.top.equalTo(idLabel.snp.bottom).offset(4)
            make.size.equalTo(72)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

