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
        label.font = .bold(ofSize: 14)
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
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        //view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        view.clipsToBounds = true
        return view
    }()
    
    private let typeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 16
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var aboutLabel: UILabel = {
        let label = UILabel()
        label.font = .bold(ofSize: 16)
        label.textColor = self.backgroundColor
        label.text = "About"
        return label
    }()
    
    private let weightHeightAndMovesView = WeightHeightAndMovesView()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = """
        It has a preference for hot things. When it rains, steam is said to spout from the tip of its tail.
        """
        label.numberOfLines = 0
        label.font = .regular(ofSize: 12)
        label.textColor = .darkGray
        label.textAlignment = .justified
        return label
    }()
    
    private lazy var baseStatsLabel: UILabel = {
        let label = UILabel()
        label.font = .bold(ofSize: 16)
        label.textColor = self.backgroundColor
        label.text = "Base Stats"
        return label
    }()
    
    private lazy var baseStatsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(BaseStatsTableViewCell.self, forCellReuseIdentifier: "statsCell")
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.isScrollEnabled = false
        tableView.isUserInteractionEnabled = false
        return tableView
    }()
    
    var types = ["Type"]

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: .null)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.roundCorners([.bottomLeft, .bottomRight], radius: 44)
        updateOpaquePokeballSize()
        updateTypeStackView()
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
    
    private func updateTypeStackView() {
        self.types.forEach { type in
            let typeView = TypeView()
            self.typeStackView.addArrangedSubview(typeView)
        }
    }
}

// MARK: Table View Delegate
extension PokemonView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "statsCell", for: indexPath) as? BaseStatsTableViewCell
        cell?.setupCell(typeColor: self.backgroundColor ?? .red)
        return cell ?? UITableViewCell()
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
        setupTypeStackView()
        setupAboutLabel()
        setupWeigthHeightAndMovesView()
        setupDescriptionLabel()
        setupBaseStatsLabel()
        setupBaseStatsTableView()
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
            make.bottom.equalToSuperview()//.offset(-4)
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
    
    private func setupTypeStackView() {
        self.contentView.addSubview(typeStackView)
    
        typeStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(62)
        }
    }
    
    private func setupAboutLabel() {
        self.contentView.addSubview(aboutLabel)
    
        aboutLabel.snp.makeConstraints { make in
            make.top.equalTo(typeStackView.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setupWeigthHeightAndMovesView() {
        self.contentView.addSubview(weightHeightAndMovesView)
        
        weightHeightAndMovesView.snp.makeConstraints { make in
            make.top.equalTo(aboutLabel.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setupDescriptionLabel() {
        self.contentView.addSubview(descriptionLabel)
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(weightHeightAndMovesView.snp.bottom).offset(28)
            make.leading.trailing.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setupBaseStatsLabel() {
        self.contentView.addSubview(baseStatsLabel)
        
        baseStatsLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(18)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setupBaseStatsTableView() {
        self.contentView.addSubview(baseStatsTableView)
        
        baseStatsTableView.snp.makeConstraints { make in
            make.top.equalTo(baseStatsLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(24)
            make.bottom.equalToSuperview()
        }
    }
}

extension UIView {
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
         let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
         let mask = CAShapeLayer()
         mask.path = path.cgPath
         self.layer.mask = mask
    }
}
