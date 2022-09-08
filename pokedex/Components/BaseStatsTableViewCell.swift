//
//  BaseStatsTableViewCell.swift
//  pokedex
//
//  Created by Rossana Rocha on 06/09/22.
//

import UIKit

final class BaseStatsTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .bold(ofSize: 12)
        label.text = "XX"
        label.numberOfLines = 0
        label.textColor = self.typeColor
        label.textAlignment = .center
        return label
    }()
    
    private let dividerLine: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private let quantityLabel: UILabel = {
        let label = UILabel()
        label.font = .regular(ofSize: 12)
        label.text = "000"
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var totalQuantityView: UIView = {
        let view = UIView()
        view.backgroundColor = self.typeColor?.withAlphaComponent(0.5)
        view.layer.cornerRadius = 3
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var percentageView: UIView = {
        let view = UIView()
        view.backgroundColor = self.typeColor
        view.clipsToBounds = true
        return view
    }()
    
    var typeColor: UIColor?
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
        self.backgroundColor = .clear
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Layout
extension BaseStatsTableViewCell {
    
    func setupCell(typeColor: UIColor) {
        self.typeColor = typeColor
        self.nameLabel.textColor = typeColor
        self.totalQuantityView.backgroundColor = typeColor.withAlphaComponent(0.5)
        self.percentageView.backgroundColor = typeColor
    }
    
    private func setupLayout() {
        setupNameLabel()
        setupDividerLine()
        setupQuantityLabel()
        setupTotalQuantityView()
        setupPercentageView()
    }
    
    private func setupNameLabel() {
        self.contentView.addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    private func setupDividerLine() {
        self.contentView.addSubview(dividerLine)
        
        dividerLine.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel.snp.trailing).offset(12)
            make.top.bottom.equalToSuperview()
            make.width.equalTo(1)
        }
    }
    
    private func setupQuantityLabel() {
        self.contentView.addSubview(quantityLabel)
        
        quantityLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(dividerLine.snp.trailing).offset(12)
        }
    }
    
    private func setupTotalQuantityView() {
        self.contentView.addSubview(totalQuantityView)
        
        totalQuantityView.snp.makeConstraints { make in
            make.leading.equalTo(quantityLabel.snp.trailing).offset(8)
            make.trailing.equalToSuperview()
            make.height.equalTo(4)
            make.centerY.equalToSuperview()
        }
    }
    
    private func setupPercentageView() {
        self.totalQuantityView.addSubview(percentageView)
        
        percentageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalToSuperview()
            make.width.equalTo(20)
        }
    }
}

