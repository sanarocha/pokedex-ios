//
//  TypeView.swift
//  pokedex
//
//  Created by Rossana Rocha on 28/07/22.
//

import UIKit

final class TypeView: UIView {

    private let typeLabel: UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 10
        label.backgroundColor = .mediumGray
        label.font = .bold(ofSize: 14)
        label.textColor = .white
        label.text = "Type"
        return label
    }()
    
    // MARK: - Init
    init() {
        super.init(frame: .null)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Layout
extension TypeView {
    
    private func setupLayout() {
        self.layer.cornerRadius = 10
        self.backgroundColor = .mediumGray
        setupTypeLabel()
    }
    
    private func setupTypeLabel() {
        self.addSubview(typeLabel)
        
        typeLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(2)
            make.leading.trailing.equalToSuperview().inset(8)
        }
    }
}
